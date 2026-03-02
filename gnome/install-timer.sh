#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$MODULE_DIR/.." && pwd)"
source "$REPO_DIR/_common/log.sh"
init_logger_for_source "${BASH_SOURCE[0]}" "gnome-backup"
UNIT_DIR="$HOME/.config/systemd/user"
SERVICE="$UNIT_DIR/dotfiles-gnome-backup.service"
TIMER="$UNIT_DIR/dotfiles-gnome-backup.timer"

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
systemctl --user enable --now dotfiles-gnome-backup.timer

log "installed timer: dotfiles-gnome-backup.timer"
log "check status with: systemctl --user status dotfiles-gnome-backup.timer"
