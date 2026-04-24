#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../../_common/linking.sh"
init_logger_for_source "${BASH_SOURCE[0]}" "gnome/private-vault"

link_path "$MODULE_DIR/bin/private-init" "$HOME/.local/bin/private-init"
link_path "$MODULE_DIR/bin/private-mount" "$HOME/.local/bin/private-mount"
link_path "$MODULE_DIR/bin/private-umount" "$HOME/.local/bin/private-umount"
link_path "$MODULE_DIR/bin/private-open" "$HOME/.local/bin/private-open"
link_path "$MODULE_DIR/bin/private-lock-watch" "$HOME/.local/bin/private-lock-watch"
link_path "$MODULE_DIR/bin/private-gocryptfs-pass" "$HOME/.local/bin/private-gocryptfs-pass"

link_path "$MODULE_DIR/applications/private-vault.desktop" "$HOME/.local/share/applications/private-vault.desktop"
link_path "$MODULE_DIR/applications/private-vault.desktop" "$HOME/Desktop/private-vault.desktop"
