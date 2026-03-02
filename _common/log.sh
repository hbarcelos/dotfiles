#!/usr/bin/env bash
set -euo pipefail

make_logger() {
  local fn_name="$1"
  local suffix="$2"
  if [[ -n "$suffix" ]]; then
    eval "${fn_name}() { printf '[dotfiles/${suffix}] %s\\n' \"\$*\" >&2; }"
  else
    eval "${fn_name}() { printf '[dotfiles] %s\\n' \"\$*\" >&2; }"
  fi
}

derive_log_suffix() {
  local source_path="$1"
  local file_name dir_name

  file_name="$(basename "$source_path")"
  dir_name="$(basename "$(dirname "$source_path")")"

  case "$file_name" in
    install.sh)
      printf 'install'
      ;;
    setup.sh|setup.zsh|backup.sh|install-timer.sh)
      printf '%s' "$dir_name"
      ;;
    *)
      printf '%s' "${file_name%.*}"
      ;;
  esac
}

init_logger_for_source() {
  local source_path="${1:-}"
  local explicit_suffix="${2-}"
  local suffix

  if [[ "${2+x}" == x ]]; then
    suffix="$explicit_suffix"
  elif [[ -n "$source_path" ]]; then
    suffix="$(derive_log_suffix "$source_path")"
  else
    suffix="dotfiles"
  fi

  make_logger log "$suffix"
}
