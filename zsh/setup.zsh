#!/usr/bin/env zsh
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${(%):-%N}")" && pwd)"
source "$MODULE_DIR/../_common/log.sh"
init_logger_for_source "$MODULE_DIR/setup.zsh"

backup_existing() {
  local target="$1"
  local backup="${target}.bak.$(date +%Y%m%d-%H%M%S)"
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

link_path "$MODULE_DIR/.zshrc" "$HOME/.zshrc"
