#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../_common/linking.sh"

rebuild_bat_cache() {
  local status=0

  if ! command -v bat >/dev/null 2>&1; then
    log "bat not found in PATH; skipping cache rebuild"
    return 0
  fi

  log "Rebuilding bat cache"
  set +e
  bat cache --build 2>&1 | while IFS= read -r line; do
    log "$line"
  done
  status=${PIPESTATUS[0]}
  set -e

  if [[ "$status" -ne 0 ]]; then
    log "Warning: bat cache rebuild failed (exit $status)"
  fi
}

link_path "$MODULE_DIR/.config/bat" "$HOME/.config/bat"
rebuild_bat_cache
