#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

TEST_REPO="$TMPDIR/repo"
FAKE_HOME="$TMPDIR/home"
FAKE_BIN="$TMPDIR/bin"

mkdir -p "$TEST_REPO" "$FAKE_HOME" "$FAKE_BIN"
cp -R "$REPO_DIR/_common" "$TEST_REPO/_common"
cp -R "$REPO_DIR/gnome" "$TEST_REPO/gnome"

cat > "$FAKE_BIN/dconf" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

command_name="${1:-}"
shift || true

case "$command_name" in
  load)
    cat >/dev/null
    ;;
  dump)
    exit 0
    ;;
  *)
    printf 'unexpected dconf invocation: %s\n' "$command_name" >&2
    exit 1
    ;;
esac
EOF
chmod +x "$FAKE_BIN/dconf"

rm -rf "$TEST_REPO/gnome/backups"
mkdir -p "$TEST_REPO/gnome/backups"
cat > "$TEST_REPO/gnome/backups/gtk-3.0-settings.ini" <<'EOF'
[Settings]
gtk-theme-name=adw-gtk3-dark
EOF
cat > "$TEST_REPO/gnome/backups/gtk-4.0-settings.ini" <<'EOF'
[Settings]
gtk-application-prefer-dark-theme=1
EOF

HOME="$FAKE_HOME" PATH="$FAKE_BIN:$PATH" bash "$TEST_REPO/gnome/setup.sh" --no-backup

assert_file_contains() {
  local path="$1"
  local expected="$2"

  if [[ ! -f "$path" ]]; then
    printf 'expected file at %s\n' "$path" >&2
    exit 1
  fi

  if ! grep -Fqx "$expected" "$path"; then
    printf 'expected %s to contain exact line: %s\n' "$path" "$expected" >&2
    exit 1
  fi
}

assert_file_contains "$FAKE_HOME/.config/gtk-3.0/settings.ini" "gtk-theme-name=adw-gtk3-dark"
assert_file_contains "$FAKE_HOME/.config/gtk-4.0/settings.ini" "gtk-application-prefer-dark-theme=1"
