# dotfiles
Opinionated, fast, and intentionally minimal. These are my daily-driver configs, not a starter kit.

## Install
```bash
git clone git@github.com:amusingaxl/dotfiles.git "$HOME/dotfiles"
cd "$HOME/dotfiles"
./install.sh
```

`install.sh` is an orchestrator that runs module setup scripts.

### Skip Modules
You can skip any module with `--no-<module>`:

```bash
./install.sh --no-bat --no-kitty
./install.sh --no-git --no-gnome
./install.sh --no-logiops
```

Supported module flags:
- `--no-bat`
- `--no-core`
- `--no-fontconfig`
- `--no-git`
- `--no-gnome`
- `--no-gnome-settings-sync-timer`
- `--no-gnome-backup-timer` (deprecated alias for `--no-gnome-settings-sync-timer`)
- `--no-gnome-screenshot-cleanup-timer`
- `--no-kitty`
- `--no-logiops`
- `--no-logid` (deprecated alias for `--no-logiops`)
- `--no-spaceship`
- `--no-tmux`
- `--no-vim`
- `--no-zsh`

## Repo Structure
Each concern lives in its own module:

- `bat/`
- `core/`
- `fontconfig/`
- `git/`
- `gnome/`
- `kitty/`
- `logiops/`
- `spaceship/`
- `tmux/`
- `vim/`
- `zsh/`

Shared helpers are in `_common/`.

## Logging
Shared logging is in `_common/log.sh`.

- Default format: `[dotfiles] ...`
- Module format: `[dotfiles/<suffix>] ...`
- Logs are written to stderr.

## Module Notes
### `git/`
`git/setup.sh`:
- links `git/.gitconfig` and `git/.gitconfig.d`
- prompts for personal/work identities
- generates files under `$HOME/.gitconfig.local.d`
- manages SSH host blocks and `$HOME/.config/git/allowed_signers`

### `zsh/`
`zsh/setup.zsh` is a zsh script and is only run by `install.sh` when install is launched from zsh.

### `logiops/`
- tracked config file: `logiops/#etc#logid.cfg`
- setup symlinks it to `/etc/logid.cfg`
- setup also installs a tracked `logid.service` override and a delayed post-boot restart timer under `/etc/systemd/system`
- warns if `logid.service` is not available in systemd

### `spaceship/`
`spaceship/setup.sh` warns when Spaceship is not detected.
It checks:
- zplug registration (`zplug list`)
- AUR package install (`pacman -Q spaceship-prompt`)

### `fontconfig/`
`fontconfig/setup.sh` validates that `Hasklug Nerd Font Mono` is installed and warns otherwise.

## GNOME Backups
GNOME state is tracked under `gnome/backups/`.

Key files:
- `gnome/backups/dconf-org-gnome.ini`
- `gnome/backups/dconf-org-gtk.ini`
- `gnome/backups/mimeapps.list`
- `gnome/backups/extensions-*.txt`
- `gnome/backups/extensions-manifest.txt`

Commands:

```bash
./gnome/backup.sh
./gnome/setup.sh
./gnome/setup.sh --dry-run
./gnome/install-settings-sync-timer.sh
./gnome/install-screenshot-cleanup-timer.sh
```

Notes:
- local/system extension inventories are metadata-only (no full extension source trees)
- `gnome/backup.sh` auto-generates `extensions-manifest.txt`
- `gnome/setup.sh` attempts auto-install from that manifest when possible
- `gnome/install-screenshot-cleanup-timer.sh` installs a user timer that deletes files older than 24 hours from `~/Pictures/Screenshots` (or the XDG Pictures dir equivalent)
