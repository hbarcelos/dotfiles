#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$MODULE_DIR/.." && pwd)"
source "$REPO_DIR/_common/log.sh"
init_logger_for_source "${BASH_SOURCE[0]}" "gnome-screenshot-cleanup"
UNIT_DIR="$HOME/.config/systemd/user"
SERVICE="$UNIT_DIR/dotfiles-screenshot-cleanup.service"
TIMER="$UNIT_DIR/dotfiles-screenshot-cleanup.timer"

mkdir -p "$UNIT_DIR"

cat > "$SERVICE" <<SERVICE
[Unit]
Description=Delete screenshots older than 24 hours
After=graphical-session.target

[Service]
Type=oneshot
WorkingDirectory=$REPO_DIR
ExecStart=$MODULE_DIR/cleanup-screenshots.sh
SERVICE

cat > "$TIMER" <<'TIMER'
[Unit]
Description=Run screenshot cleanup periodically

[Timer]
OnBootSec=15m
OnUnitActiveSec=1h
Persistent=true
RandomizedDelaySec=10m

[Install]
WantedBy=timers.target
TIMER

systemctl --user daemon-reload
systemctl --user enable --now dotfiles-screenshot-cleanup.timer

log "installed timer: dotfiles-screenshot-cleanup.timer"
log "check status with: systemctl --user status dotfiles-screenshot-cleanup.timer"
