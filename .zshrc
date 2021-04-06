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

  # export NVM_NO_USE=true
  export NVM_COMPLETION=true
  export NVM_AUTO_USE=true
  export NVM_LAZY_LOAD=true
  export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim' 'yarn')
  export NVM_SYMLINK_CURRENT=true
  zplug "plugins/nvm", from:oh-my-zsh
  zplug "lukechilds/zsh-nvm"
  zplug "plugins/nvm", from:oh-my-zsh

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
  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  zplug "zsh-users/zsh-autosuggestions"
  zplug "chrissicool/zsh-256color"
  zplug "djui/alias-tips"
  zplug "hlissner/zsh-autopair", defer:2
  zplug "Tarrasch/zsh-colors"
  zplug "vifon/deer", use:deer
  zplug "webyneter/docker-aliases"
  zplug "MichaelAquilina/zsh-emojis"
  zplug "Seinh/git-prune"
  zplug "stedolan/jq", \
      from:gh-r, \
      as:command, \
      rename-to:jq
  zplug "unixorn/bitbucket-git-helpers.plugin.zsh"
  zplug "so-fancy/diff-so-fancy", \
      as:command, \
      use:"diff-so-fancy"
  zplug "adrieankhisbe/diractions"
  zplug "junegunn/fzf-bin", \
      from:gh-r, \
      as:command, \
      rename-to:fzf, \
      use:"*linux*amd64*"
  zplug "junegunn/fzf",\
      use:"shell/*.zsh",\
      defer:2
  zplug "BurntSushi/ripgrep", \
      from:gh-r, \
      as:command, \
      rename-to:rg, \
      if:"[[ $OSTYPE = linux* && ! -f /proc/syno_cpu_arch ]]"
  # Enable when issue #576 is fixed:
  # https://github.com/ogham/exa/issues/576
  #
  # zplug "DarrinTisdale/zsh-aliases-exa", \
  #     from:gh-r, \
  #     as:plugin, \
  #     defer:2

  # export ZSH_TMUX_AUTOSTART=true
  # export ZSH_TMUX_AUTOSTART_ONCE=true

  # Load the theme.
  # zplug theme robbyrussell
  zplug "NelsonBrandao/absolute", as:theme
  # GEOMETRY_PROMPT_PLUGINS=(git +node) zplug "geometry-zsh/geometry"

  # zplug check returns true if all packages are installed
  # Therefore, when it returns false, run zplug install
  # if ! zplug check; then
  #   zplug install
  # fi

  # source plugins and add commands to the PATH
  zplug load

  # fasd config
  alias j='fasd_cd -d'

  # Deer config
  autoload -U deer
  zle -N deer
  bindkey '\ek' deer

  # ZSH autosuggestions config
  bindkey '^ ' autosuggest-accept
else
  echo -e "Zplug not installed yet."
  echo -e "Installing...\n"
  echo -e "    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh\n"
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# pacaur, yaourt, makepkg: use powerpill instead of pacman
pacman -Q powerpill >& /dev/null && export PACMAN=/usr/bin/powerpill

# fasd initialization
which fasd > /dev/null && eval "$(fasd --init auto)"

# Zsh fpath config
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Profile
[ -f ~/.profile ] && source ~/.profile

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
