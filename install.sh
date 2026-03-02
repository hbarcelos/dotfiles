#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$REPO_DIR/_common/linking.sh"
init_logger_for_source "${BASH_SOURCE[0]}" ""

usage() {
  cat <<USAGE
Usage: ./install.sh [--no-<module> ...]

Installs dotfiles by creating symlinks from this repository into your home directory.
Existing targets are moved aside with a timestamped .bak suffix.

Options:
  --no-bat                 Skip bat module setup (bat/setup.sh)
  --no-core                Skip core module setup (core/setup.sh)
  --no-fontconfig          Skip fontconfig module setup (fontconfig/setup.sh)
  --no-git                 Skip git module setup (git/setup.sh)
  --no-gnome               Skip gnome module setup (gnome/setup.sh)
  --no-gnome-backup-timer  Skip gnome timer setup (gnome/install-timer.sh)
  --no-kitty               Skip kitty module setup (kitty/setup.sh)
  --no-logiops             Skip logiops module setup (logiops/setup.sh)
  --no-logid               Alias for --no-logiops (deprecated)
  --no-spaceship           Skip spaceship module setup (spaceship/setup.sh)
  --no-tmux                Skip tmux module setup (tmux/setup.sh)
  --no-vim                 Skip vim module setup (vim/setup.sh)
  --no-zsh                 Skip zsh module setup (zsh/setup.zsh)
  -h, --help     Show this help message
USAGE
}

setup_bat=true
setup_core=true
setup_fontconfig=true
setup_logiops=true
setup_git=true
setup_gnome=true
setup_kitty=true
setup_spaceship=true
setup_tmux=true
setup_vim=true
setup_zsh=true
install_backup_timer_gnome=true

if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
  printf 'Run this script as your normal user, not as root/sudo.\n' >&2
  exit 1
fi

while [[ $# -gt 0 ]]; do
  case "$1" in
    --no-bat)
      setup_bat=false
      ;;
    --no-core)
      setup_core=false
      ;;
    --no-fontconfig)
      setup_fontconfig=false
      ;;
    --no-logiops|--no-logid)
      setup_logiops=false
      ;;
    --no-git)
      setup_git=false
      ;;
    --no-gnome)
      setup_gnome=false
      ;;
    --no-gnome-backup-timer)
      install_backup_timer_gnome=false
      ;;
    --no-kitty)
      setup_kitty=false
      ;;
    --no-spaceship)
      setup_spaceship=false
      ;;
    --no-tmux)
      setup_tmux=false
      ;;
    --no-vim)
      setup_vim=false
      ;;
    --no-zsh)
      setup_zsh=false
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown option: %s\n\n' "$1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

if [[ "$setup_bat" == true ]]; then
  "$REPO_DIR/bat/setup.sh"
else
  log "Skipped bat setup (--no-bat)"
fi

if [[ "$setup_fontconfig" == true ]]; then
  "$REPO_DIR/fontconfig/setup.sh"
else
  log "Skipped fontconfig setup (--no-fontconfig)"
fi

if [[ "$setup_kitty" == true ]]; then
  "$REPO_DIR/kitty/setup.sh"
else
  log "Skipped kitty setup (--no-kitty)"
fi

if [[ "$setup_spaceship" == true ]]; then
  "$REPO_DIR/spaceship/setup.sh"
else
  log "Skipped spaceship setup (--no-spaceship)"
fi

if [[ "$setup_core" == true ]]; then
  "$REPO_DIR/core/setup.sh"
else
  log "Skipped core setup (--no-core)"
fi

if [[ "$setup_tmux" == true ]]; then
  "$REPO_DIR/tmux/setup.sh"
else
  log "Skipped tmux setup (--no-tmux)"
fi

if [[ "$setup_vim" == true ]]; then
  "$REPO_DIR/vim/setup.sh"
else
  log "Skipped vim setup (--no-vim)"
fi

if [[ "$setup_zsh" == true ]]; then
  if [[ "${SHELL:-}" == */zsh ]] || [[ "$(ps -p "$PPID" -o comm= 2>/dev/null || true)" == "zsh" ]]; then
    "$REPO_DIR/zsh/setup.zsh"
  else
    log "Skipped zsh setup: run install from zsh to apply zsh module"
  fi
else
  log "Skipped zsh setup (--no-zsh)"
fi

if [[ "$setup_git" == true ]]; then
  "$REPO_DIR/git/setup.sh"
else
  log "Skipped git setup (--no-git)"
fi

if [[ "$setup_logiops" == true ]]; then
  "$REPO_DIR/logiops/setup.sh"
else
  log "Skipped logiops setup (--no-logiops)"
fi

if [[ "$setup_gnome" == true ]]; then
  "$REPO_DIR/gnome/setup.sh"
else
  log "Skipped gnome setup (--no-gnome)"
fi

if [[ "$install_backup_timer_gnome" == true ]]; then
  if command -v systemctl >/dev/null 2>&1; then
    "$REPO_DIR/gnome/install-timer.sh"
  else
    log "Skipped gnome backup timer install: systemctl not found"
  fi
else
  log "Skipped gnome backup timer install (--no-gnome-backup-timer)"
fi

log "Install complete"
