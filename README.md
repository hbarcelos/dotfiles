# dotfiles
Opinionated, fast, and intentionally minimal. These are my daily-driver configs, not a starter kit.

## Install
```bash
git clone git@github.com:amusingaxl/dotfiles.git "$HOME/dotfiles"
cd "$HOME/dotfiles"
./install.sh
```

To skip `logid` system config:
```bash
./install.sh --no-logid
```

To skip git or gnome setup:
```bash
./install.sh --no-git
./install.sh --no-gnome
```

Notes:
- The install script will warn if `Hasklug Nerd Font Mono` is not installed.
- Existing files are backed up with a timestamped `.bak` suffix.

## Git
`install.sh` runs `setup-git.sh`, which:

- Prompts for personal/work git identity info.
- Generates `$HOME/.gitconfig.local.d/personal-identity.gitconfig` and `$HOME/.gitconfig.local.d/work-identity.gitconfig`.
- Generates `$HOME/.gitconfig.local.d/work-urls.gitconfig` (URL rewrite rules).
- Writes `$HOME/.gitconfig.local.d/local.gitconfig` to wire in conditional includes.
- Creates/updates `$HOME/.ssh/config` with a `github.com-work` host block.
- Creates/updates `$HOME/.config/git/allowed_signers`.

This setup is strict on SSH signing, and expects separate personal/work identities.

## Fonts
Fontconfig defines the `monospace` alias in:

- `$HOME/.config/fontconfig/conf.d/99-monospace.conf`

and forces `Hasklug Nerd Font Mono Med`.

Kitty sets `font_family Hasklug Nerd Font Mono Med` and `italic_font Hasklug Nerd Font Mono Med Italic` directly in `kitty.conf`.
