#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_SUFFIX="$(date +%Y%m%d-%H%M%S)"

usage() {
  cat <<USAGE
Usage: ./install.sh [--no-logid]

Installs dotfiles by creating symlinks from this repository into your home directory.
Existing targets are moved aside with a timestamped .bak suffix.

Options:
  --no-git       Skip git setup (setup-git.sh)
  --no-gnome     Skip gnome setup (setup-gnome.sh)
  --no-logid     Skip installing /etc/logid.cfg
  -h, --help     Show this help message
USAGE
}

log() {
  printf '[dotfiles] %s\n' "$*"
}

warn_missing_font() {
  local font_name="$1"
  if [[ -z "$font_name" ]]; then
    log "Warning: missing font name for verification"
    return
  fi
  if ! command -v fc-list >/dev/null 2>&1; then
    log "Warning: fc-list not found; cannot verify ${font_name} installation"
    return
  fi
  (
    set +o pipefail
    if ! fc-list | rg -q "$font_name"; then
      exit 1
    fi
  ) || {
    log "Warning: ${font_name} not found; install it to ensure proper monospace rendering"
  }
}

backup_existing() {
  local target="$1"
  local backup="${target}.bak.${BACKUP_SUFFIX}"
  if [[ ! -e "$target" && ! -L "$target" ]]; then
    return
  fi
  mv "$target" "$backup"
  log "Backed up $target -> $backup"
}

link_path() {
  local source="$1"
  local target="$2"

  mkdir -p "$(dirname "$target")"

  if [[ -L "$target" ]]; then
    local current
    current="$(readlink "$target")"
    if [[ "$current" == "$source" ]]; then
      log "OK $target already linked"
      return
    fi
    backup_existing "$target"
  elif [[ -e "$target" ]]; then
    backup_existing "$target"
  fi

  ln -s "$source" "$target"
  log "Linked $target -> $source"
}

link_logid_with_sudo() {
  local source="$REPO_DIR/logid.cfg"
  local target="/etc/logid.cfg"
  local backup="${target}.bak.${BACKUP_SUFFIX}"

  if [[ ! -f "$source" ]]; then
    log "Skipped logid install: $source not found"
    return
  fi

  if sudo test -L "$target"; then
    local current
    current="$(sudo readlink "$target")"
    if [[ "$current" == "$source" ]]; then
      log "OK $target already linked"
      return
    fi
    sudo mv "$target" "$backup"
    log "Backed up $target -> $backup"
  elif sudo test -e "$target"; then
    sudo mv "$target" "$backup"
    log "Backed up $target -> $backup"
  fi

  sudo ln -s "$source" "$target"
  log "Linked $target -> $source"
}

install_logid=true
install_git=true
install_gnome=true

if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
  printf 'Run this script as your normal user, not as root/sudo.\n' >&2
  exit 1
fi

while [[ $# -gt 0 ]]; do
  case "$1" in
    --no-logid)
      install_logid=false
      ;;
    --no-git)
      install_git=false
      ;;
    --no-gnome)
      install_gnome=false
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown option: %s\n\n' "$1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

link_path "$REPO_DIR/.config/bat" "$HOME/.config/bat"
link_path "$REPO_DIR/.config/fontconfig" "$HOME/.config/fontconfig"
link_path "$REPO_DIR/.config/kitty" "$HOME/.config/kitty"
link_path "$REPO_DIR/.config/spaceship" "$HOME/.config/spaceship"
link_path "$REPO_DIR/.ethrc" "$HOME/.ethrc"
link_path "$REPO_DIR/.gitconfig" "$HOME/.gitconfig"
link_path "$REPO_DIR/.gitconfig.d" "$HOME/.gitconfig.d"
mkdir -p "$HOME/.gitconfig.local.d"
link_path "$REPO_DIR/.profile" "$HOME/.profile"
link_path "$REPO_DIR/.tmux" "$HOME/.tmux"
link_path "$REPO_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_path "$REPO_DIR/.vimrc" "$HOME/.vimrc"
link_path "$REPO_DIR/.zshrc" "$HOME/.zshrc"

if [[ "$install_git" == true ]]; then
  "$REPO_DIR/setup-git.sh"
else
  log "Skipped git setup (--no-git)"
fi

if [[ "$install_logid" == true ]]; then
  link_logid_with_sudo
fi

if [[ "$install_gnome" == true ]]; then
  "$REPO_DIR/setup-gnome.sh"
else
  log "Skipped gnome setup (--no-gnome)"
fi

log "Install complete"
if [[ "$install_logid" == false ]]; then
  log "Skipped logid install (--no-logid)"
fi

warn_missing_font "Hasklug Nerd Font Mono"
