#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$MODULE_DIR/.." && pwd)"
source "$REPO_DIR/_common/log.sh"
init_logger_for_source "${BASH_SOURCE[0]}" "gnome-screenshot-cleanup"

pictures_dir="$HOME/Pictures"

if command -v xdg-user-dir >/dev/null 2>&1; then
  detected_pictures_dir="$(xdg-user-dir PICTURES 2>/dev/null || true)"
  if [[ -n "$detected_pictures_dir" && "$detected_pictures_dir" != "$HOME" ]]; then
    pictures_dir="$detected_pictures_dir"
  fi
fi

screenshot_dir="$pictures_dir/Screenshots"

if [[ ! -d "$screenshot_dir" ]]; then
  log "Skipped screenshot cleanup: $screenshot_dir not found"
  exit 0
fi

deleted_count=0

while IFS= read -r -d '' stale_screenshot; do
  rm -f -- "$stale_screenshot"
  deleted_count=$((deleted_count + 1))
done < <(find "$screenshot_dir" -maxdepth 1 -type f -mmin +1440 -print0)

if (( deleted_count == 0 )); then
  log "No screenshots older than 24h in $screenshot_dir"
  exit 0
fi

log "Deleted $deleted_count screenshots older than 24h from $screenshot_dir"
