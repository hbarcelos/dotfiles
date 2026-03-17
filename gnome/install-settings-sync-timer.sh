#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$MODULE_DIR/.." && pwd)"
source "$REPO_DIR/_common/log.sh"
init_logger_for_source "${BASH_SOURCE[0]}" "gnome-settings-sync"
UNIT_DIR="$HOME/.config/systemd/user"
SERVICE="$UNIT_DIR/dotfiles-gnome-settings-sync.service"
TIMER="$UNIT_DIR/dotfiles-gnome-settings-sync.timer"

mkdir -p "$UNIT_DIR"

cat > "$SERVICE" <<SERVICE
[Unit]
Description=Backup GNOME config into dotfiles repo
After=graphical-session.target

[Service]
Type=oneshot
WorkingDirectory=$REPO_DIR
ExecStart=$MODULE_DIR/backup.sh --quiet
SERVICE

cat > "$TIMER" <<'TIMER'
[Unit]
Description=Run GNOME dotfiles backup periodically

[Timer]
OnCalendar=weekly
Persistent=true
RandomizedDelaySec=10m

[Install]
WantedBy=timers.target
TIMER

systemctl --user daemon-reload
systemctl --user enable --now dotfiles-gnome-settings-sync.timer

log "installed timer: dotfiles-gnome-settings-sync.timer"
log "check status with: systemctl --user status dotfiles-gnome-settings-sync.timer"
