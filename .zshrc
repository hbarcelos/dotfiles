unsetopt flow_control

zmodload zsh/zprof
# Configuration of global environment variables
export DISABLE_AUTO_TITLE=true
export EDITOR='vim'
# export TERM="screen-256color"

# Fixes weird characters on Vim when running out of tmux
# alias vim='TERM="xterm-256color" vim'

if [ ! -f ~/.zplug/init.zsh ]; then
  echo -e "Zplug not installed yet."
  echo -e "Installing...\n"
  echo -e "    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh\n"
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
else
  source ~/.zplug/init.zsh

  zplug "zplug/zplug", hook-build:"zplug --self-manage"
  zplug "robbyrussell/oh-my-zsh", as:plugin, use:"lib/*.zsh"
  zplug "plugins/aws", from:oh-my-zsh
  zplug "plugins/colored-man-pages", from:oh-my-zsh
  zplug "plugins/command-not-found", from:oh-my-zsh
  zplug "plugins/common-aliases", from:oh-my-zsh
  zplug "plugins/cp", from:oh-my-zsh
  zplug "plugins/docker", from:oh-my-zsh
  zplug "plugins/docker-compose", from:oh-my-zsh
  zplug "plugins/git", from:oh-my-zsh
  zplug "plugins/git-extras", from:oh-my-zsh
  zplug "plugins/node", from:oh-my-zsh
  zplug "plugins/npm", from:oh-my-zsh
  zplug "cowboyd/zsh-volta", from:github
  zplug "plugins/sudo", from:oh-my-zsh
  zplug "plugins/yarn", from:oh-my-zsh
  zplug "chrissicool/zsh-256color"
  zplug "djui/alias-tips"
  zplug "hlissner/zsh-autopair", defer:2
  zplug "Tarrasch/zsh-colors"
  zplug "vifon/deer", use:deer
  zplug "webyneter/docker-aliases"
  zplug "MichaelAquilina/zsh-emojis"
  zplug "Seinh/git-prune"
  zplug "adrieankhisbe/diractions"
  zplug "junegunn/fzf", as:command, hook-build:"./install --all"
  zplug "junegunn/fzf", as:plugin, use:"shell/*.zsh", defer:2
  zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
  zplug 'zsh-users/zsh-completions', depth:1 # more completions

  ### Plugins below must be declared in this order {
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  zplug "zsh-users/zsh-autosuggestions"

  # Set the priority when loading
  # e.g., zsh-syntax-highlighting must be loaded
  # after executing compinit command and sourcing other plugins
  # (If the defer tag is given 2 or above, run after compinit command)
  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  ### }

  # zplug check returns true if all packages are installed
  # Therefore, when it returns false, run zplug install
  if ! zplug check; then
    zplug install
  fi

  # source plugins and add commands to the PATH
  zplug load

  # autosuggest keybindings {
  bindkey '^ ' autosuggest-accept
  bindkey -M vicmd "k" up-line-or-beginning-search
  bindkey -M vicmd "j" down-line-or-beginning-search
  # }

  # Deer config
  autoload -U deer
  zle -N deer
  bindkey '\ed' deer

  # <Alt-E> to edit the current command line
  autoload -z edit-command-line
  zle -N edit-command-line
  bindkey '\ee' edit-command-line
fi

setopt append_history # better concurrent shell history sharing
setopt auto_pushd # cd foo; cd bar; popd --> in foo again
setopt complete_in_word # more intuitive completions
setopt no_beep # BEEP
setopt extended_glob # better globs
setopt extended_history # better history
setopt hist_expire_dups_first # don't fill your history as quickly with junk
setopt hist_ignore_space # ` command` doesn't save to history
setopt hist_subst_pattern # better globs / parameter expansion
setopt hist_reduce_blanks # `a  b` normalizes to `a b` in history
setopt hist_verify # reduce oops I sudoed the wrong thing
setopt ksh_glob # better globs
setopt long_list_jobs # easier to read job stuff
setopt null_glob # sane globbing
setopt pipe_fail # fail when the first command in a pipeline fails
setopt share_history # better concurrent shell history sharing
setopt no_rm_star_silent # confirm on `rm *` (default, but let's be safe)
setopt prompt_cr prompt_sp # don't clobber output without trailing newlines

# see zshmodules(1)
zmodload -Fm zsh/files b:zf_\* # emergency file manip under zf_*
zmodload zsh/complist # completion menus
zmodload zsh/mathfunc # better mathematical evaluation
zmodload zsh/termcap 2>/dev/null # terminal resources (if available)
zmodload zsh/terminfo 2>/dev/null # terminal resources (if available)

# see zshcontrib(1)
autoload -Uz zargs # like xargs, but works with globs
autoload -Uz zcalc # like bc, but uses Zsh mathematical evaluation
autoload -Uz zmathfunc; zmathfunc # better mathematical evaluation
autoload -Uz zmv # like mv, but uses patterns (`zmv '(*).lis' '$1.txt'`)

zstyle ':completion:*' menu yes select # complete with a nicer menu

alias sudo='sudo ' # make sudo work with aliases
eval "$(dircolors -b)" # ls colors

# make sure term is in application mode when zle is active (for terminfo)
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  zle-line-init() { echoti smkx }; zle -N zle-line-init
  zle-line-finish() { echoti rmkx }; zle -N zle-line-finish
fi

# Zsh fpath config
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Added by Krypton
export GPG_TTY=$(tty)

# Bat
# [ -x "$(command -v bat)" ] && {
#   export MANROFFOPT="-c"
#   export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# }

# Convenient ETH scripts
[ -f "${HOME}/.ethrc" ] && source "${HOME}/.ethrc"

# Zoxide
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Kitty
if [[ -n $KITTY_INSTALLATION_DIR ]]; then
  export KITTY_SHELL_INTEGRATION="no-cursor no-title"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi

autoload -Uz add-zsh-hook

function get-right-most-paths() {
  local partial_path=$1
  local _limit=${2:-20}

  if [ ${#partial_path} -gt $_limit ]; then
    echo "/.../$(basename $partial_path)"
  else
    echo $partial_path
  fi
}

function get-custom-cwd() {
  if [[ "$PWD" = "$HOME"* ]]; then
    local custom_path=$(get-right-most-paths "${PWD#"$HOME"}" 20)
    echo '~'"${custom_path}"
  else
    echo $(get-right-most-paths "$PWD" 20)
  fi
}

function xterm-title-precmd () {
	print -n -- '\e]2;'"$(get-custom-cwd)"'\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}\005{B}%~\005{-}\e\\'
}

function xterm-title-preexec () {
	print -n -- '\e]2;'"${(q)1}"' # ' && print -n -- "$(get-custom-cwd)"'\a'
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}\005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (Eterm*|alacritty*|aterm*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm-title-precmd
	add-zsh-hook -Uz preexec xterm-title-preexec
fi

########

# SSH agent config
if [ -S "${XDG_RUNTIME_DIR}/ssh-agent.socket" ]; then
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
else
  echo "The systemd service \`ssh-agent.service\` is not running. Please run:"
  echo -e "\n\tsystemctl --user enable --now ssh-agent.service"
fi

# GOLANG
export GOPATH="${GOPATH:-${HOME}/go}"

# Yarn Config
export PATH="${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:${PATH}:${HOME}/.local/bin:${PATH}"

# Python config
export PYTHONPATH="$(python -c "import site, os; print(os.path.join(site.USER_BASE, 'lib', 'python', 'site-packages'))"):${PYTHONPATH}"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# Virtualenv Wrapper setup
[ -f /usr/bin/virtualenvwrapper.sh ] && source /usr/bin/virtualenvwrapper.sh

# Volta config
export VOLTA_HOME="${HOME}/.volta"
export PATH="${VOLTA_HOME}/bin:${PATH}"

# Rust/Cargo config
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
export PATH="${HOME}/.cargo/bin:${PATH}"

# Foundry
export PATH="${HOME}/.foundry/bin:${PATH}"

# Zplug binaries
[ -d ~/.zplug/repos/zplug/zplug/bin ] && \
  export PATH="${HOME}/.zplug/repos/zplug/zplug/bin:${PATH}"
[ -d ~/.zplug/bin ] && \
  export PATH="${HOME}/.zplug/bin:${PATH}"

