#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../_common/linking.sh"

SOURCE="$MODULE_DIR/#etc#logid.cfg"
TARGET="/etc/logid.cfg"
BACKUP_SUFFIX="$(date +%Y%m%d-%H%M%S)"

if [[ ! -f "$SOURCE" ]]; then
  log "Skipped logiops install: $SOURCE not found"
  exit 0
fi

if command -v systemctl >/dev/null 2>&1; then
  if ! systemctl list-unit-files --type=service --no-legend 2>/dev/null | awk '{print $1}' | grep -qx "logid.service"; then
    log "Warning: systemd unit logid.service not found. Install/enabled logiops may be missing."
  fi
else
  log "Warning: systemctl not found; cannot verify logid.service availability."
fi

if sudo test -L "$TARGET"; then
  current="$(sudo readlink "$TARGET")"
  if [[ "$current" == "$SOURCE" ]]; then
    log "OK $TARGET already linked"
    exit 0
  fi
  sudo mv "$TARGET" "${TARGET}.bak.${BACKUP_SUFFIX}"
  log "Backed up $TARGET -> ${TARGET}.bak.${BACKUP_SUFFIX}"
elif sudo test -e "$TARGET"; then
  sudo mv "$TARGET" "${TARGET}.bak.${BACKUP_SUFFIX}"
  log "Backed up $TARGET -> ${TARGET}.bak.${BACKUP_SUFFIX}"
fi

sudo ln -s "$SOURCE" "$TARGET"
log "Linked $TARGET -> $SOURCE"
