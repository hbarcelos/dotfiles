#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$MODULE_DIR/.." && pwd)"
TARGET_GITCONFIG_DIR="$HOME/.gitconfig.local.d"
LOCAL_GITCONFIG_FILE="$TARGET_GITCONFIG_DIR/local.gitconfig"
source "$REPO_DIR/_common/linking.sh"

trim_blank_edges() {
  local file="$1"
  if [[ ! -f "$file" ]]; then
    return
  fi
  sed \
    -e '1,/[^[:space:]]/ { /^[[:space:]]*$/d; }' \
    -e ':a' -e '/^[[:space:]]*$/{$d;N;ba;}' \
    "$file" > "${file}.trim"
  mv "${file}.trim" "$file"
}

ensure_two_blank_lines_before_first_block() {
  local file="$1"
  local begin_pattern="$2"
  if [[ ! -f "$file" || ! -s "$file" ]]; then
    return
  fi
  local tmp="${file}.twoblanks"
  awk -v pat="$begin_pattern" '
    { lines[NR] = $0 }
    END {
      first = 0
      for (i = 1; i <= NR; i++) {
        if (lines[i] ~ pat) { first = i; break }
      }
      if (first == 0) {
        for (i = 1; i <= NR; i++) print lines[i]
        exit
      }
      # Determine if there is non-blank content before first block.
      has_content = 0
      for (i = 1; i < first; i++) {
        if (lines[i] !~ /^[[:space:]]*$/) { has_content = 1; break }
      }
      # Print content before first block without trailing blank lines.
      if (has_content) {
        last = 0
        for (i = first - 1; i >= 1; i--) {
          if (lines[i] !~ /^[[:space:]]*$/) { last = i; break }
        }
        for (i = 1; i <= last; i++) print lines[i]
        print ""
        print ""
      }
      # Print from first block onward (dropping leading blanks if no content).
      for (i = first; i <= NR; i++) print lines[i]
    }
  ' "$file" > "$tmp"
  mv "$tmp" "$file"
}

backup_file() {
  local target="$1"
  if [[ ! -e "$target" && ! -L "$target" ]]; then
    return
  fi
  local backup="${target}.bak.$(date +%Y%m%d-%H%M%S)"
  cp "$target" "$backup"
  log "Backed up $target -> $backup"
}

prompt_required() {
  local prompt="$1"
  local value=""

  while true; do
    read -r -p "${prompt}: " value
    if [[ -n "$value" ]]; then
      printf '%s' "$value"
      return 0
    fi
  done
}

escape_sed_replacement() {
  printf '%s' "$1" | sed -e 's/[&/\\]/\\&/g'
}

read_gitconfig_value() {
  local file="$1"
  local key="$2"
  local value=""
  value="$(git config --file "$file" --get "$key" 2>/dev/null || true)"
  if [[ "$value" == "$HOME/~/"* ]]; then
    printf '%s' "$HOME/${value#${HOME}/~/}"
    return
  fi
  printf '%s' "$value"
}

write_gitconfig_value() {
  local file="$1"
  local key="$2"
  local value="$3"
  git config --file "$file" "$key" "$value"
}

expand_tilde_for_io() {
  local path="$1"
  path="$(printf '%s' "$path" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  path="${path#\"}"
  path="${path%\"}"
  local home_tilde_prefix="$HOME/~/"
  if [[ "$path" == "$home_tilde_prefix"* ]]; then
    printf '%s' "$HOME/${path#${home_tilde_prefix}}"
    return
  fi
  if [[ "$path" == *"/~/"* ]]; then
    printf '%s' "${path//\/~\//\/}"
    return
  fi
  if [[ "${path:0:2}" == "~/" ]]; then
    printf '%s' "$HOME/${path:2}"
    return
  fi
  if [[ "$path" == /* ]]; then
    printf '%s' "$path"
    return
  fi
  if [[ -n "$path" ]]; then
    printf '%s' "$HOME/$path"
    return
  fi
  printf '%s' "$path"
}

normalize_ssh_identity_output() {
  local path="$1"
  local home_tilde_prefix="$HOME/~/"
  if [[ "$path" == "$home_tilde_prefix"* ]]; then
    printf '%s' "$HOME/${path#${home_tilde_prefix}}"
  else
    printf '%s' "$path"
  fi
}

key_readable() {
  local signingkey="$1"
  local expanded
  expanded="$(expand_tilde_for_io "$signingkey")"
  [[ -n "$expanded" && ( -f "${expanded}.pub" || -f "$expanded" ) ]]
}

prompt_identity() {
  local label="$1"
  local with_work_urls="${2:-false}"
  local -n out_name="$3"
  local -n out_email="$4"
  local -n out_signingkey="$5"
  local -n out_slugs="$6"

  log "Configuring $label git identity"
  out_name="$(prompt_required "Git ${label} user.name")"
  out_email="$(prompt_required "Git ${label} user.email")"
  out_signingkey="$(prompt_required "Git ${label} user.signingkey")"
  if [[ "$with_work_urls" == "true" ]]; then
    out_slugs="$(prompt_required "Git ${label} org/user slugs (comma-separated)")"
  else
    out_slugs=""
  fi
}

render_gitconfig_template() {
  local template="$1"
  local target="$2"
  local name="$3"
  local email="$4"
  local signingkey="$5"

  if [[ -f "$target" ]]; then
    return 0
  fi
  if [[ ! -f "$template" ]]; then
    log "Missing template: $template"
    return 1
  fi

  local esc_name esc_email esc_signingkey
  esc_name="$(escape_sed_replacement "$name")"
  esc_email="$(escape_sed_replacement "$email")"
  esc_signingkey="$(escape_sed_replacement "$signingkey")"

  sed \
    -e "s/__NAME__/${esc_name}/g" \
    -e "s/__EMAIL__/${esc_email}/g" \
    -e "s/__SIGNINGKEY__/${esc_signingkey}/g" \
    "$template" > "$target"

  chmod 600 "$target"
  log "Wrote $target"
}

read_work_slugs_from_urls() {
  local file="$1"
  if [[ ! -f "$file" ]]; then
    return 0
  fi
  awk '
    match($0, /\[url "git@github.com-work:([^"]+)\/"\]/, m) {
      if (count > 0) {
        printf ","
      }
      printf "%s", m[1]
      count++
    }
    END { if (count > 0) printf "\n" }
  ' "$file"
}

write_work_urls_file() {
  local work_slugs="$1"
  local file="$2"
  local template="$3"
  local existed_before=true

  if [[ -z "$work_slugs" ]]; then
    return 0
  fi

  if [[ ! -f "$template" ]]; then
    log "Missing template: $template"
    return 1
  fi

  local tmp
  tmp="$(mktemp)"
  if [[ ! -f "$file" ]]; then
    existed_before=false
  fi

  : > "$tmp"
  IFS=',' read -r -a slug_items <<< "$work_slugs"
  for slug in "${slug_items[@]}"; do
    slug="$(printf '%s' "$slug" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
    if [[ -z "$slug" ]]; then
      continue
    fi
    sed "s/__SLUG__/${slug}/g" "$template" >> "$tmp"
    printf '\n' >> "$tmp"
  done

  if ! cmp -s "$file" "$tmp"; then
    if [[ "$existed_before" == true ]]; then
      backup_file "$file"
    fi
    mv "$tmp" "$file"
    chmod 600 "$file"
    log "Updated $file"
  else
    rm "$tmp"
    log "Work URLs already up to date"
  fi
}

ensure_local_gitconfig() {
  local work_slugs="$1"
  local file="$LOCAL_GITCONFIG_FILE"
  local begin_marker="# BEGIN DOTFILES LOCAL"
  local end_marker="# END DOTFILES LOCAL"
  local existed_before=true
  local local_dir="~/.gitconfig.local.d"

  mkdir -p "$TARGET_GITCONFIG_DIR"

  if [[ ! -f "$file" ]]; then
    existed_before=false
    touch "$file"
    chmod 600 "$file"
  fi

  local tmp
  tmp="$(mktemp)"

  awk -v begin="$begin_marker" -v end="$end_marker" '
    $0 == begin { in_block=1; next }
    $0 == end { in_block=0; next }
    !in_block { print }
  ' "$file" > "$tmp"

  {
    echo
    echo "$begin_marker"

    echo "[include]"
    echo "  path = $local_dir/personal-identity.gitconfig"

    if [[ -n "$work_slugs" ]]; then
      IFS=',' read -r -a slug_items <<< "$work_slugs"
      for slug in "${slug_items[@]}"; do
        slug="$(printf '%s' "$slug" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
        if [[ -z "$slug" ]]; then
          continue
        fi

        cat <<EOF
[includeIf "hasconfig:remote.*.url:git@github.com:${slug}/"]
  path = $local_dir/work-identity.gitconfig
[includeIf "hasconfig:remote.*.url:https://github.com/${slug}/"]
  path = $local_dir/work-identity.gitconfig
[includeIf "hasconfig:remote.*.url:ssh://git@github.com/${slug}/"]
  path = $local_dir/work-identity.gitconfig
[includeIf "hasconfig:remote.*.url:git@github.com:${slug}/"]
  path = $local_dir/work-urls.gitconfig
[includeIf "hasconfig:remote.*.url:https://github.com/${slug}/"]
  path = $local_dir/work-urls.gitconfig
[includeIf "hasconfig:remote.*.url:ssh://git@github.com/${slug}/"]
  path = $local_dir/work-urls.gitconfig
EOF
      done
    fi

    cat <<EOF
[includeIf "gitdir:$HOME/work/"]
  path = $local_dir/work-identity.gitconfig
[includeIf "gitdir:$HOME/work/"]
  path = $local_dir/work-urls.gitconfig
EOF

    echo "$end_marker"
  } >> "$tmp"

  if ! cmp -s "$file" "$tmp"; then
    if [[ "$existed_before" == true ]]; then
      backup_file "$file"
    fi
    mv "$tmp" "$file"
    chmod 600 "$file"
    log "Updated $file"
  else
    rm "$tmp"
    log "Local gitconfig already up to date"
  fi
}

ensure_identity_file() {
  local label="$1"
  local file="$2"
  local template="$3"
  local with_work_urls="${4:-false}"
  local name_ref="$5"
  local email_ref="$6"
  local signingkey_ref="$7"
  local slugs_ref="$8"
  local -n out_name="$name_ref"
  local -n out_email="$email_ref"
  local -n out_signingkey="$signingkey_ref"
  local -n out_slugs="$slugs_ref"

  if [[ -f "$file" ]]; then
    out_name="$(read_gitconfig_value "$file" user.name)"
    out_email="$(read_gitconfig_value "$file" user.email)"
    out_signingkey="$(read_gitconfig_value "$file" user.signingkey)"

    if [[ -z "$out_name" ]]; then
      out_name="$(prompt_required "Git ${label} user.name")"
      write_gitconfig_value "$file" user.name "$out_name"
    fi
    if [[ -z "$out_email" ]]; then
      out_email="$(prompt_required "Git ${label} user.email")"
      write_gitconfig_value "$file" user.email "$out_email"
    fi
    if [[ -z "$out_signingkey" ]] || ! key_readable "$out_signingkey"; then
      if [[ -n "$out_signingkey" ]]; then
        log "Signing key not found for ${label}: $out_signingkey"
      fi
      out_signingkey="$(prompt_required "Git ${label} user.signingkey")"
      write_gitconfig_value "$file" user.signingkey "$out_signingkey"
    fi

    out_slugs=""
    return 0
  fi

  prompt_identity "$label" "$with_work_urls" \
    "$name_ref" "$email_ref" "$signingkey_ref" "$slugs_ref"

  render_gitconfig_template \
    "$template" \
    "$file" \
    "$out_name" \
    "$out_email" \
    "$out_signingkey"
}

get_public_key_fields() {
  local signingkey="$1"
  signingkey="$(expand_tilde_for_io "$signingkey")"
  local pub_line=""

  if [[ -f "${signingkey}.pub" ]]; then
    pub_line="$(head -n 1 "${signingkey}.pub")"
  elif [[ -f "$signingkey" ]]; then
    pub_line="$(ssh-keygen -y -f "$signingkey" 2>/dev/null || true)"
  fi

  if [[ -z "$pub_line" ]]; then
    return 1
  fi

  printf '%s %s' "$(awk '{print $1}' <<<"$pub_line")" "$(awk '{print $2}' <<<"$pub_line")"
}

is_allowed_signers_line_valid() {
  local line="$1"
  [[ "$line" =~ ^[^[:space:]]+[[:space:]]+ssh-ed25519[[:space:]]+[A-Za-z0-9+/=]+$ ]]
}

ensure_allowed_signers() {
  local email="$1"
  local key="$2"
  local label="${3:-GITHUB}"
  key="$(expand_tilde_for_io "$key")"
  local config_dir="$HOME/.config/git"
  local file="$config_dir/allowed_signers"
  local begin_marker="# BEGIN DOTFILES ALLOWED SIGNERS ${label}"
  local end_marker="# END DOTFILES ALLOWED SIGNERS ${label}"
  local line=""

  mkdir -p "$config_dir"

  local existed_before=true
  if [[ ! -f "$file" ]]; then
    existed_before=false
    touch "$file"
    chmod 600 "$file"
  fi

  local tmp
  tmp="$(mktemp)"

  awk -v begin="$begin_marker" -v end="$end_marker" '
    $0 == begin { in_block=1; next }
    $0 == end { in_block=0; next }
    !in_block { print }
  ' "$file" > "$tmp"

  trim_blank_edges "$tmp"

  if [[ -n "$email" && -n "$key" ]]; then
    if key_fields="$(get_public_key_fields "$key")"; then
      line="${email} ${key_fields}"
      if ! is_allowed_signers_line_valid "$line"; then
        log "Warning: invalid allowed_signers format for ${label} entry"
        line=""
      fi
    else
      log "Warning: could not read public key for $key"
    fi
  fi

  if [[ -s "$tmp" ]]; then
    printf '\n' >> "$tmp"
  fi
  {
    echo "$begin_marker"
    [[ -n "$line" ]] && echo "$line"
    echo "$end_marker"
  } >> "$tmp"
  ensure_two_blank_lines_before_first_block "$tmp" '^# BEGIN DOTFILES'

  if ! cmp -s "$file" "$tmp"; then
    if [[ "$existed_before" == true ]]; then
      backup_file "$file"
    fi
    mv "$tmp" "$file"
    chmod 600 "$file"
    log "Updated $file"
  else
    rm "$tmp"
    log "Allowed signers already up to date"
  fi
}

ensure_ssh_config() {
  local ssh_dir="$HOME/.ssh"
  local config="$ssh_dir/config"
  local identity="${1:-$HOME/.ssh/id_ed25519_work}"
  local host="${2:-github.com-work}"
  local label="${3:-GITHUB}"
  identity="$(normalize_ssh_identity_output "$identity")"
  local begin_marker="# BEGIN DOTFILES ${label}"
  local end_marker="# END DOTFILES ${label}"

  mkdir -p "$ssh_dir"
  chmod 700 "$ssh_dir"

  local existed_before=true
  if [[ ! -f "$config" ]]; then
    existed_before=false
    touch "$config"
    chmod 600 "$config"
  fi

  local tmp
  tmp="$(mktemp)"

  awk -v begin="$begin_marker" -v end="$end_marker" '
    $0 == begin { in_block=1; next }
    $0 == end { in_block=0; next }
    !in_block { print }
  ' "$config" > "$tmp"

  trim_blank_edges "$tmp"

  if [[ -s "$tmp" ]]; then
    printf '\n' >> "$tmp"
  fi
  local use_keychain_line=""
  if [[ "$(uname -s)" == "Darwin" ]]; then
    use_keychain_line="  UseKeychain yes"
  fi

  cat >> "$tmp" <<EOF
$begin_marker
Host ${host}
  HostName github.com
  User git
  IdentityFile ${identity}
  IdentitiesOnly yes
  AddKeysToAgent yes
${use_keychain_line}
$end_marker
EOF
  ensure_two_blank_lines_before_first_block "$tmp" '^# BEGIN DOTFILES'

  if ! cmp -s "$config" "$tmp"; then
    if [[ "$existed_before" == true ]]; then
      backup_file "$config"
    fi
    mv "$tmp" "$config"
    chmod 600 "$config"
    log "Updated $config"
  else
    rm "$tmp"
    log "SSH config already up to date"
  fi
}

mkdir -p "$TARGET_GITCONFIG_DIR"
link_path "$MODULE_DIR/.gitconfig" "$HOME/.gitconfig"
link_path "$MODULE_DIR/.gitconfig.d" "$HOME/.gitconfig.d"

personal_name=""
personal_email=""
personal_signingkey=""
personal_slugs=""
work_name=""
work_email=""
work_signingkey=""
work_slugs=""

ensure_identity_file \
  "personal" \
  "$TARGET_GITCONFIG_DIR/personal-identity.gitconfig" \
  "$MODULE_DIR/.gitconfig.d/personal-identity.gitconfig.template" \
  "false" \
  personal_name personal_email personal_signingkey personal_slugs

ensure_identity_file \
  "work" \
  "$TARGET_GITCONFIG_DIR/work-identity.gitconfig" \
  "$MODULE_DIR/.gitconfig.d/work-identity.gitconfig.template" \
  "true" \
  work_name work_email work_signingkey work_slugs

if [[ -z "$work_slugs" ]]; then
  work_slugs="$(read_work_slugs_from_urls "$TARGET_GITCONFIG_DIR/work-urls.gitconfig")"
  if [[ -z "$work_slugs" ]]; then
    work_slugs="$(prompt_required "Git work org/user slugs (comma-separated)")"
  fi
fi

write_work_urls_file \
  "$work_slugs" \
  "$TARGET_GITCONFIG_DIR/work-urls.gitconfig" \
  "$MODULE_DIR/.gitconfig.d/work-urls.gitconfig.template"
ensure_local_gitconfig "$work_slugs"

ensure_ssh_config "$personal_signingkey" "github.com" "GITHUB PERSONAL"
ensure_ssh_config "$work_signingkey" "github.com-work" "GITHUB WORK"
ensure_allowed_signers "$personal_email" "$personal_signingkey" "GITHUB PERSONAL"
ensure_allowed_signers "$work_email" "$work_signingkey" "GITHUB WORK"
