#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../_common/linking.sh"

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
    if ! fc-list | grep -q -- "$font_name"; then
      exit 1
    fi
  ) || {
    log "Warning: ${font_name} not found; install it to ensure proper monospace rendering"
  }
}

link_path "$MODULE_DIR/.config/fontconfig" "$HOME/.config/fontconfig"
warn_missing_font "Hasklug Nerd Font Mono"
