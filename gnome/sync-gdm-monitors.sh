#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../_common/log.sh"
init_logger_for_source "${BASH_SOURCE[0]}" "gnome-gdm-monitors"

SOURCE="${HOME}/.config/monitors.xml"
TARGET="/var/lib/gdm/.config/monitors.xml"

usage() {
  cat <<USAGE
Usage: $0 [--from-backup]

Copies a monitor layout into GDM for the login screen.

Options:
  --from-backup  Use gnome/backups/monitors.xml instead of ~/.config/monitors.xml
USAGE
}

if [[ "${1:-}" == "--from-backup" ]]; then
  SOURCE="$MODULE_DIR/backups/monitors.xml"
  shift
fi

if [[ $# -gt 0 ]]; then
  usage >&2
  exit 1
fi

if [[ ! -s "$SOURCE" ]]; then
  printf 'error: monitors.xml not found or empty: %s\n' "$SOURCE" >&2
  exit 1
fi

if ! id gdm >/dev/null 2>&1; then
  printf 'error: gdm user not found\n' >&2
  exit 1
fi

sudo install -d -m 755 /var/lib/gdm/.config
sudo install -m 644 -o gdm -g gdm "$SOURCE" "$TARGET"
log "Installed $SOURCE -> $TARGET"
