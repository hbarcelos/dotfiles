#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../_common/linking.sh"

BACKUP_SUFFIX="$(date +%Y%m%d-%H%M%S)"

link_root_path() {
  local source="$1"
  local target="$2"

  if [[ ! -f "$source" ]]; then
    log "Skipped $target: $source not found"
    return
  fi

  sudo mkdir -p "$(dirname "$target")"

  if sudo test -L "$target"; then
    local current
    current="$(sudo readlink "$target")"
    if [[ "$current" == "$source" ]]; then
      log "OK $target already linked"
      return
    fi
    sudo mv "$target" "${target}.bak.${BACKUP_SUFFIX}"
    log "Backed up $target -> ${target}.bak.${BACKUP_SUFFIX}"
  elif sudo test -e "$target"; then
    sudo mv "$target" "${target}.bak.${BACKUP_SUFFIX}"
    log "Backed up $target -> ${target}.bak.${BACKUP_SUFFIX}"
  fi

  sudo ln -s "$source" "$target"
  log "Linked $target -> $source"
}

install_root_file() {
  local source="$1"
  local target="$2"

  if [[ ! -f "$source" ]]; then
    log "Skipped $target: $source not found"
    return
  fi

  sudo mkdir -p "$(dirname "$target")"

  if sudo test -L "$target"; then
    sudo mv "$target" "${target}.bak.${BACKUP_SUFFIX}"
    log "Backed up $target -> ${target}.bak.${BACKUP_SUFFIX}"
  elif sudo test -e "$target"; then
    if sudo cmp -s "$source" "$target"; then
      log "OK $target already installed"
      return
    fi

    sudo mv "$target" "${target}.bak.${BACKUP_SUFFIX}"
    log "Backed up $target -> ${target}.bak.${BACKUP_SUFFIX}"
  fi

  sudo install -m 0644 "$source" "$target"
  log "Installed $target from $source"
}

if command -v systemctl >/dev/null 2>&1; then
  if ! systemctl list-unit-files --type=service --no-legend 2>/dev/null | awk '{print $1}' | grep -qx "logid.service"; then
    log "Warning: systemd unit logid.service not found. Install/enabled logiops may be missing."
  fi
else
  log "Warning: systemctl not found; cannot verify logid.service availability."
fi

link_root_path "$MODULE_DIR/#etc#logid.cfg" "/etc/logid.cfg"
install_root_file "$MODULE_DIR/systemd/logid.service.d/override.conf" "/etc/systemd/system/logid.service.d/override.conf"
install_root_file "$MODULE_DIR/systemd/logid-postboot-restart.service" "/etc/systemd/system/logid-postboot-restart.service"
install_root_file "$MODULE_DIR/systemd/logid-postboot-restart.timer" "/etc/systemd/system/logid-postboot-restart.timer"

if command -v systemctl >/dev/null 2>&1; then
  sudo systemctl daemon-reload
  sudo systemctl reenable logid-postboot-restart.timer >/dev/null
  sudo systemctl restart logid-postboot-restart.timer
  log "Reloaded systemd and ensured logid post-boot restart timer is enabled"
fi
