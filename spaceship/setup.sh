#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../_common/linking.sh"

warn_missing_spaceship() {
  local zplug_home="${ZPLUG_HOME:-$HOME/.zplug}"
  local zplug_repo="${zplug_home}/repos/spaceship-prompt/spaceship-prompt"

  if [[ -f "${zplug_repo}/spaceship.zsh" || -f "${zplug_repo}/spaceship.zsh-theme" ]]; then
    return
  fi

  if command -v zplug >/dev/null 2>&1; then
    if zplug list 2>/dev/null | grep -Fx 'spaceship-prompt/spaceship-prompt' >/dev/null; then
      return
    fi
  fi

  if command -v pacman >/dev/null 2>&1 && pacman -Qq spaceship-prompt >/dev/null 2>&1; then
    return
  fi

  log "Warning: Spaceship prompt was not detected."
  log "Install via zplug: zplug 'spaceship-prompt/spaceship-prompt', from:github"
  log "Install via AUR: paru -S spaceship-prompt (or yay -S spaceship-prompt)"
}

link_path "$MODULE_DIR/.config/spaceship" "$HOME/.config/spaceship"
warn_missing_spaceship
