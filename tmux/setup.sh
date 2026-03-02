#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../_common/linking.sh"

link_path "$MODULE_DIR/.tmux" "$HOME/.tmux"
link_path "$MODULE_DIR/.tmux.conf" "$HOME/.tmux.conf"
