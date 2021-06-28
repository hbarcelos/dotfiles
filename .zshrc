unsetopt flow_control

zmodload zsh/zprof
# Configuration of global environment variables
export DISABLE_AUTO_TITLE=true
export EDITOR='vim'
export TERM="screen-256color"

# Fixes weird characters on Vim when running out of tmux
alias vim='TERM="xterm-256color" vim'

# if [ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]; then
#   source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
# fi

if [ -f ~/.zplug/init.zsh ]; then
  source ~/.zplug/init.zsh

  zplug "zplug/zplug", hook-build:"zplug --self-manage"
  zplug "robbyrussell/oh-my-zsh", as:plugin, use:"lib/*.zsh"

  zplug "RiverGlide/zsh-nodenv", from:gitlab
  # export NVM_NO_USE=true
  # export NVM_COMPLETION=true
  # export NVM_AUTO_USE=true
  # export NVM_LAZY_LOAD=true
  # export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim' 'yarn')
  # export NVM_SYMLINK_CURRENT=true
  # zplug "plugins/nvm", from:oh-my-zsh
  # zplug "lukechilds/zsh-nvm"

  zplug "plugins/aws", from:oh-my-zsh
  zplug "plugins/colored-man-pages", from:oh-my-zsh
  zplug "plugins/command-not-found", from:oh-my-zsh
  zplug "plugins/common-aliases", from:oh-my-zsh
  zplug "plugins/cp", from:oh-my-zsh
  zplug "plugins/docker", from:oh-my-zsh
  zplug "plugins/docker-compose", from:oh-my-zsh
  # zplug "plugins/dotenv", from:oh-my-zsh
  zplug "plugins/fasd", from:oh-my-zsh
  zplug "plugins/git", from:oh-my-zsh
  zplug "plugins/git-extras", from:oh-my-zsh
  zplug "plugins/node", from:oh-my-zsh
  zplug "plugins/npm", from:oh-my-zsh
  zplug "plugins/sudo", from:oh-my-zsh
  zplug "plugins/tmux", from:oh-my-zsh
  zplug "plugins/yarn", from:oh-my-zsh

  zplug "chrissicool/zsh-256color"
  zplug "djui/alias-tips"
  zplug "hlissner/zsh-autopair", defer:2
  zplug "Tarrasch/zsh-colors"
  zplug "vifon/deer", use:deer
  zplug "webyneter/docker-aliases"
  zplug "MichaelAquilina/zsh-emojis"
  zplug "Seinh/git-prune"
  zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
  zplug "unixorn/bitbucket-git-helpers.plugin.zsh"
  zplug "so-fancy/diff-so-fancy", as:command, use:"diff-so-fancy"
  zplug "adrieankhisbe/diractions"
  zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
  zplug "junegunn/fzf", use:"shell/*.zsh", defer:2
  zplug "BurntSushi/ripgrep", from:gh-r, as:command, rename-to:rg, if:"[[ $OSTYPE = linux* && ! -f /proc/syno_cpu_arch ]]"

  # export ZSH_TMUX_AUTOSTART=true
  # export ZSH_TMUX_AUTOSTART_ONCE=true

  # Load the theme.
  # zplug "themes/robbyrussell", from:oh-my-zsh, as:theme
  # zplug "NelsonBrandao/absolute", as:theme
  # zplug mafredri/zsh-async, from:github
  # zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
  SPACESHIP_PROMPT_SEPARATE_LINE=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_DEFAULT_PREFIX=''
  SPACESHIP_DIR_PREFIX=' '
  SPACESHIP_GIT_PREFIX=''
  SPACESHIP_GIT_BRANCH_COLOR=223 #215
  SPACESHIP_GIT_STATUS_COLOR=223 #215
  SPACESHIP_GIT_STATUS_UNTRACKED='?'
  SPACESHIP_GIT_STATUS_MODIFIED='✹'
  SPACESHIP_GIT_STATUS_ADDED='✚'
  SPACESHIP_GIT_STATUS_DELETED='✖'
  SPACESHIP_NODE_COLOR=green #034
  SPACESHIP_PACKAGE_SHOW=false
  SPACESHIP_BATTERY_THRESHOLD=15
  SPACESHIP_EXEC_TIME_SHOW=false
  zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

  # Plugins below must be declared in this order {
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  ZSH_AUTOSUGGEST_USE_ASYNC=true
  zplug "zsh-users/zsh-autosuggestions"

  zplug "zsh-users/zsh-syntax-highlighting", defer:2

  KEYTIMEOUT=10
  VIM_MODE_ESC_PREFIXED_WANTED='bdfhul.g'  # Default is 'bdf.g'
  zplug "softmoth/zsh-vim-mode"
  # }

  zplug 'zsh-users/zsh-completions', depth:1 # more completions

  # zplug check returns true if all packages are installed
  # Therefore, when it returns false, run zplug install
  if ! zplug check; then
    zplug install
  fi

  # source plugins and add commands to the PATH
  zplug load

  # fasd config
  alias j='fasd_cd -d'

  # autosuggest keybindings {
  bindkey '^ ' autosuggest-accept
  bindkey -M vicmd "k" up-line-or-beginning-search
  bindkey -M vicmd "j" down-line-or-beginning-search
  # }

  # Deer config
  autoload -U deer
  zle -N deer
  bindkey '\ek' deer

  # Toggle between emacs and vi mode {
  select-vi() { spaceship_vi_mode_enable }
  select-emacs() { spaceship_vi_mode_disable }

  zle -N select-vi
  zle -N select-emacs

  bindkey -v '\ev' select-emacs
  bindkey -e '\ev' select-vi

  # }

else
  echo -e "Zplug not installed yet."
  echo -e "Installing...\n"
  echo -e "    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh\n"
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
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

# pacaur, yaourt, makepkg: use powerpill instead of pacman
pacman -Q powerpill >& /dev/null && export PACMAN=/usr/bin/powerpill

# fasd initialization
which fasd > /dev/null && eval "$(fasd --init auto)"

# Zsh fpath config
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Profile
[ -f ~/.profile ] && source ~/.profile

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Nodenv {

function install-nodenv-plugin() {
  local plugin="$1"
  local plugin_dir="$(nodenv root)"/plugins/"${plugin##*/}"

  if [ ! -d "$plugin_dir" ]; then
    echo "Adding plugin: nodenv/${plugin}..."
    git clone https://github.com/"${plugin}".git "$plugin_dir"
  fi
}

# Automatically install plugins if missing
function load-nodenv-plugins() {
  local nodenv_plugins=(
    'nodenv/node-build-update-defs'
    'nodenv/nodenv-aliases'
    'nodenv/nodenv-package-json-engine'
    'nodenv/nodenv-package-rehash'
    'nodenv/nodenv-npm-migrate'
    'nodenv/nodenv-update'
    'ouchxp/nodenv-nvmrc'
  )

  FUNCS=$(functions install-nodenv-plugin)

  printf "%s\0" "${nodenv_plugins[@]}" | xargs -0 -I% -P4 zsh -c "eval $FUNCS; install-nodenv-plugin %"
}

load-nodenv-plugins

function nodenv-install-latest() {
  nodenv install $(nodenv install --list | grep "^\s*""${1}""\." | sort -rn | head -1)
}
#}

# Added by Krypton
export GPG_TTY=$(tty)

# Enpass CLI config
alias enp='enpasscli -vault="/home/henrique/Documentos/Enpass/Vaults/primary/" -sort'
