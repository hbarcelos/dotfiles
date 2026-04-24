#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

FAKE_ROOT="$TMPDIR/root"
FAKE_BIN="$TMPDIR/bin"
mkdir -p "$FAKE_ROOT" "$FAKE_BIN"

cat > "$FAKE_BIN/sudo" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

fake_root="${DOTFILES_TEST_ROOT:?}"
cmd="$1"
shift

rewrite_arg() {
  case "$1" in
    /etc)
      printf '%s\n' "$fake_root/etc"
      ;;
    /etc/*)
      printf '%s\n' "$fake_root$1"
      ;;
    *)
      printf '%s\n' "$1"
      ;;
  esac
}

args=()
for arg in "$@"; do
  args+=("$(rewrite_arg "$arg")")
done

exec "$cmd" "${args[@]}"
EOF
chmod +x "$FAKE_BIN/sudo"

cat > "$FAKE_BIN/systemctl" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

if [[ "${1:-}" == "list-unit-files" ]]; then
  printf 'logid.service enabled\n'
  exit 0
fi

exit 0
EOF
chmod +x "$FAKE_BIN/systemctl"

PATH="$FAKE_BIN:$PATH" DOTFILES_TEST_ROOT="$FAKE_ROOT" bash "$REPO_DIR/logiops/setup.sh"

assert_regular_file() {
  local path="$1"

  if [[ ! -f "$path" ]]; then
    printf 'expected regular file at %s\n' "$path" >&2
    exit 1
  fi

  if [[ -L "$path" ]]; then
    printf 'expected %s to be copied, but found symlink\n' "$path" >&2
    exit 1
  fi
}

assert_symlink() {
  local path="$1"

  if [[ ! -L "$path" ]]; then
    printf 'expected symlink at %s\n' "$path" >&2
    exit 1
  fi
}

assert_regular_file "$FAKE_ROOT/etc/systemd/system/logid.service.d/override.conf"
assert_regular_file "$FAKE_ROOT/etc/systemd/system/logid-postboot-restart.service"
assert_regular_file "$FAKE_ROOT/etc/systemd/system/logid-postboot-restart.timer"
assert_symlink "$FAKE_ROOT/etc/logid.cfg"

cmp -s \
  "$REPO_DIR/logiops/systemd/logid.service.d/override.conf" \
  "$FAKE_ROOT/etc/systemd/system/logid.service.d/override.conf"
cmp -s \
  "$REPO_DIR/logiops/systemd/logid-postboot-restart.service" \
  "$FAKE_ROOT/etc/systemd/system/logid-postboot-restart.service"
cmp -s \
  "$REPO_DIR/logiops/systemd/logid-postboot-restart.timer" \
  "$FAKE_ROOT/etc/systemd/system/logid-postboot-restart.timer"
