#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../_common/log.sh"
init_logger_for_source "${BASH_SOURCE[0]}"
BACKUP_DIR="$MODULE_DIR/backups"
STATE_DIR="$HOME/.local/state/gnome-setup"
TS="$(date +%Y%m%d-%H%M%S)"
SKIP_PRE_BACKUP=false
DRY_RUN=false

usage() {
  cat <<USAGE
Usage: $0 [--no-backup] [--dry-run]

Applies GNOME settings from gnome/backups and installs extensions from manifest when possible.

Options:
  --no-backup   Skip creating a pre-apply local snapshot in ~/.local/state/gnome-setup
  --dry-run     Print planned actions without changing system state
USAGE
}

run_cmd() {
  if [[ "$DRY_RUN" == true ]]; then
    log "[dry-run] $*"
    return 0
  fi
  "$@"
}

has_extension_anywhere() {
  local uuid="$1"
  local local_root
  local_root="${XDG_DATA_HOME:-$HOME/.local/share}/gnome-shell/extensions"
  [[ -d "$local_root/$uuid" ]] || [[ -d "/usr/share/gnome-shell/extensions/$uuid" ]] || [[ -d "/usr/local/share/gnome-shell/extensions/$uuid" ]] || [[ -d "/var/lib/gnome-shell/extensions/$uuid" ]]
}

shell_version() {
  local raw
  raw="$(gnome-shell --version 2>/dev/null || true)"
  printf '%s' "$raw" | sed -E 's/.* ([0-9]+(\.[0-9]+)?).*/\1/'
}

enable_extension() {
  local uuid="$1"
  if ! command -v gnome-extensions >/dev/null 2>&1; then
    return 0
  fi
  if [[ "$DRY_RUN" == true ]]; then
    log "[dry-run] gnome-extensions enable $uuid"
    return 0
  fi
  gnome-extensions enable "$uuid" >/dev/null 2>&1 || true
}

apply_dconf_load() {
  local path="$1"
  local file="$2"
  if [[ "$DRY_RUN" == true ]]; then
    log "[dry-run] dconf load $path < $file"
    return 0
  fi
  dconf load "$path" < "$file"
}

install_local_from_ego() {
  local uuid="$1"
  local sv info_json download_url zip_path

  if [[ "$DRY_RUN" == true ]]; then
    log "[dry-run] install local extension from EGO: $uuid"
    return 0
  fi

  if ! command -v curl >/dev/null 2>&1; then
    log "Cannot install $uuid from EGO: curl missing"
    return 1
  fi
  if ! command -v gnome-extensions >/dev/null 2>&1; then
    log "Cannot install $uuid from EGO: gnome-extensions missing"
    return 1
  fi

  sv="$(shell_version)"
  if [[ -z "$sv" ]]; then
    log "Cannot install $uuid from EGO: unable to detect GNOME Shell version"
    return 1
  fi

  info_json="$(curl -fsSLG --data-urlencode "uuid=$uuid" --data-urlencode "shell_version=$sv" "https://extensions.gnome.org/extension-info/" || true)"
  download_url="$(printf '%s' "$info_json" | sed -n 's/.*"download_url"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -n1)"

  if [[ -z "$download_url" ]]; then
    log "Cannot install $uuid from EGO: download URL not found"
    return 1
  fi

  zip_path="$(mktemp --suffix=.zip)"
  if ! curl -fsSL "https://extensions.gnome.org${download_url}" -o "$zip_path"; then
    rm -f "$zip_path"
    log "Cannot download EGO package for $uuid"
    return 1
  fi

  if ! gnome-extensions install --force "$zip_path" >/dev/null 2>&1; then
    rm -f "$zip_path"
    log "gnome-extensions install failed for $uuid"
    return 1
  fi

  rm -f "$zip_path"
  log "Installed local extension from EGO: $uuid"
  return 0
}

install_local_from_url() {
  local uuid="$1"
  local url="$2"
  local zip_path

  if [[ -z "$url" ]]; then
    return 1
  fi
  if [[ "$url" == *"extensions.gnome.org"* ]]; then
    install_local_from_ego "$uuid"
    return $?
  fi

  if [[ "$DRY_RUN" == true ]]; then
    log "[dry-run] install local extension from URL: $uuid <- $url"
    return 0
  fi

  if ! command -v curl >/dev/null 2>&1; then
    log "Cannot install $uuid from URL: curl missing"
    return 1
  fi
  if ! command -v gnome-extensions >/dev/null 2>&1; then
    log "Cannot install $uuid from URL: gnome-extensions missing"
    return 1
  fi

  zip_path="$(mktemp --suffix=.zip)"
  if ! curl -fsSL "$url" -o "$zip_path"; then
    rm -f "$zip_path"
    log "Cannot download extension package for $uuid from $url"
    return 1
  fi

  if ! gnome-extensions install --force "$zip_path" >/dev/null 2>&1; then
    rm -f "$zip_path"
    log "gnome-extensions install failed for $uuid from URL"
    return 1
  fi

  rm -f "$zip_path"
  log "Installed local extension from URL: $uuid"
  return 0
}

install_system_packages() {
  local -a packages=("$@")
  local -a unique_packages=()
  local seen=" "
  local pkg

  for pkg in "${packages[@]}"; do
    [[ -n "$pkg" ]] || continue
    if [[ "$seen" == *" $pkg "* ]]; then
      continue
    fi
    seen+="$pkg "
    unique_packages+=("$pkg")
  done

  [[ ${#unique_packages[@]} -gt 0 ]] || return 0

  if [[ "$DRY_RUN" == true ]]; then
    log "[dry-run] install system packages: ${unique_packages[*]}"
    return 0
  fi

  if command -v apt-get >/dev/null 2>&1; then
    if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
      apt-get update && apt-get install -y "${unique_packages[@]}"
    else
      sudo apt-get update && sudo apt-get install -y "${unique_packages[@]}"
    fi
  elif command -v dnf >/dev/null 2>&1; then
    if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
      dnf install -y "${unique_packages[@]}"
    else
      sudo dnf install -y "${unique_packages[@]}"
    fi
  elif command -v pacman >/dev/null 2>&1; then
    if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
      pacman -S --noconfirm "${unique_packages[@]}"
    else
      sudo pacman -S --noconfirm "${unique_packages[@]}"
    fi
  elif command -v zypper >/dev/null 2>&1; then
    if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
      zypper --non-interactive install "${unique_packages[@]}"
    else
      sudo zypper --non-interactive install "${unique_packages[@]}"
    fi
  else
    log "No supported package manager detected for system extension install"
    return 1
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --no-backup)
      SKIP_PRE_BACKUP=true
      ;;
    --dry-run)
      DRY_RUN=true
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'error: unknown option: %s\n' "$1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

if ! command -v dconf >/dev/null 2>&1; then
  echo "error: dconf is not installed or not in PATH" >&2
  exit 1
fi

if [[ ! -d "$BACKUP_DIR" ]]; then
  echo "error: backup directory not found: $BACKUP_DIR" >&2
  exit 1
fi

if [[ "$DRY_RUN" == true ]]; then
  log "Dry run enabled: no system changes will be made"
fi

if [[ "$SKIP_PRE_BACKUP" == false ]]; then
  if [[ "$DRY_RUN" == true ]]; then
    log "[dry-run] mkdir -p $STATE_DIR"
    log "[dry-run] dconf dump /org/gnome/ > $STATE_DIR/pre-apply-org-gnome-${TS}.ini"
    log "[dry-run] dconf dump /org/gtk/ > $STATE_DIR/pre-apply-org-gtk-${TS}.ini"
    if [[ -f "$HOME/.config/mimeapps.list" ]]; then
      log "[dry-run] cp $HOME/.config/mimeapps.list $STATE_DIR/pre-apply-mimeapps-${TS}.list"
    fi
    log "[dry-run] would save pre-apply snapshot to $STATE_DIR"
  else
    mkdir -p "$STATE_DIR"
    dconf dump /org/gnome/ > "$STATE_DIR/pre-apply-org-gnome-${TS}.ini"
    dconf dump /org/gtk/ > "$STATE_DIR/pre-apply-org-gtk-${TS}.ini"
    if [[ -f "$HOME/.config/mimeapps.list" ]]; then
      cp "$HOME/.config/mimeapps.list" "$STATE_DIR/pre-apply-mimeapps-${TS}.list"
    fi
    log "Saved pre-apply snapshot to $STATE_DIR"
  fi
fi

if [[ -s "$BACKUP_DIR/dconf-org-gnome.ini" ]]; then
  apply_dconf_load /org/gnome/ "$BACKUP_DIR/dconf-org-gnome.ini"
  log "Applied /org/gnome/ dconf snapshot"
else
  log "Skipped /org/gnome/ (missing or empty dconf-org-gnome.ini)"
fi

if [[ -s "$BACKUP_DIR/dconf-org-gtk.ini" ]]; then
  apply_dconf_load /org/gtk/ "$BACKUP_DIR/dconf-org-gtk.ini"
  log "Applied /org/gtk/ dconf snapshot"
else
  log "Skipped /org/gtk/ (missing or empty dconf-org-gtk.ini)"
fi

if [[ -f "$BACKUP_DIR/mimeapps.list" ]]; then
  run_cmd mkdir -p "$HOME/.config"
  run_cmd cp "$BACKUP_DIR/mimeapps.list" "$HOME/.config/mimeapps.list"
  log "Applied mimeapps.list"
fi

if [[ -f "$BACKUP_DIR/extensions-manifest.txt" ]]; then
  log "Applying extensions from manifest"
  missing_local=0
  missing_system=0
  local_failed=0
  system_pkg_needed=0
  system_pkg_failed=0
  system_pkg_to_install=()

  while IFS='|' read -r uuid scope enabled source_type source _name _version; do
    [[ -n "$uuid" ]] || continue
    [[ "$uuid" == \#* ]] && continue

    if has_extension_anywhere "$uuid"; then
      if [[ "$enabled" == "true" ]]; then
        enable_extension "$uuid"
      fi
      continue
    fi

    if [[ "$scope" == "local" ]]; then
      missing_local=1
      case "$source_type" in
        ego)
          if install_local_from_ego "$uuid"; then
            [[ "$enabled" == "true" ]] && enable_extension "$uuid"
          else
            local_failed=1
          fi
          ;;
        url)
          if install_local_from_url "$uuid" "$source"; then
            [[ "$enabled" == "true" ]] && enable_extension "$uuid"
          else
            local_failed=1
          fi
          ;;
        *)
          log "Missing local extension with no auto-install source: $uuid"
          local_failed=1
          ;;
      esac
    elif [[ "$scope" == "system" ]]; then
      missing_system=1
      if [[ "$source_type" == "package" && -n "$source" ]]; then
        system_pkg_to_install+=("$source")
        system_pkg_needed=1
      else
        log "Missing system extension with no package source: $uuid"
        system_pkg_failed=1
      fi
    else
      log "Missing extension with unknown scope: $uuid"
      local_failed=1
    fi
  done < "$BACKUP_DIR/extensions-manifest.txt"

  if [[ "$system_pkg_needed" -eq 1 ]]; then
    log "Installing system extension packages"
    if ! install_system_packages "${system_pkg_to_install[@]}"; then
      system_pkg_failed=1
    fi
  fi

  if [[ "$missing_local" -eq 0 ]]; then
    log "All tracked local extensions are present."
  elif [[ "$local_failed" -eq 0 ]]; then
    log "All missing local extensions were installed."
  else
    log "Some local extensions could not be auto-installed."
  fi

  if [[ "$missing_system" -eq 0 ]]; then
    log "All tracked system extensions are present."
  elif [[ "$system_pkg_failed" -eq 0 ]]; then
    log "System extension package installation finished (verify package output above)."
  else
    log "Some system extensions could not be auto-installed."
  fi
else
  log "No extensions-manifest.txt found; skipping extension installation"
fi

log "GNOME setup restore complete"
