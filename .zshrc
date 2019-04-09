# Configuration of global environment variables
export DISABLE_AUTO_TITLE=true
export EDITOR='vim'
export TERM="screen-256color"

# Fixes weird characters on Vim when running out of tmux
alias vim='TERM="xterm-256color" vim'

if [ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]; then
  source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
fi

if [ -f ~/.zplug/init.zsh ]; then
  source ~/.zplug/init.zsh

  zplug "zplug/zplug", hook-build:"zplug --self-manage"
  zplug "robbyrussell/oh-my-zsh", as:plugin, use:"lib/*.zsh"
  # export NVM_LAZY_LOAD=true
  zplug "lukechilds/zsh-nvm"

  zplug "plugins/aws", from:oh-my-zsh
  zplug "plugins/colored-man-pages", from:oh-my-zsh
  zplug "plugins/command-not-found", from:oh-my-zsh
  zplug "plugins/common-aliases", from:oh-my-zsh
  zplug "plugins/cp", from:oh-my-zsh
  zplug "plugins/docker", from:oh-my-zsh
  zplug "plugins/docker-compose", from:oh-my-zsh
  zplug "plugins/dotenv", from:oh-my-zsh
  zplug "plugins/fasd", from:oh-my-zsh
  zplug "plugins/git", from:oh-my-zsh
  zplug "plugins/git-extras", from:oh-my-zsh
  zplug "plugins/node", from:oh-my-zsh
  zplug "plugins/npm", from:oh-my-zsh
  zplug "plugins/nvm", from:oh-my-zsh
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
  zplug "zdharma/zsh-diff-so-fancy"
  zplug "adrieankhisbe/diractions"

  # Local plugins
  zplug "~/", from:local, use:".fzf.zsh"

  export NVM_AUTO_USE=true
  export ZSH_TMUX_AUTOSTART=true
  export ZSH_TMUX_AUTOSTART_ONCE=true

  # Load the theme.
  # zplug theme robbyrussell
  zplug "NelsonBrandao/absolute", as:theme
  # GEOMETRY_PROMPT_PLUGINS=(git +node)
  # zplug "geometry-zsh/geometry"

  # zplug check returns true if all packages are installed
  # Therefore, when it returns false, run zplug install
  if ! zplug check; then
    zplug install
  fi

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
  echo -e "Please install zplug:\n"
  echo -e "    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh\n"
fi

# pacaur, yaourt, makepkg: use powerpill instead of pacman
pacman -Q powerpill >& /dev/null && export PACMAN=/usr/bin/powerpill

# pacmatic: use pacaur instead of pacman
# s/pacaur/yaourt/g if desired
pacman -Q yaourt >& /dev/null && export pacman_program=/usr/bin/yaourt

# pacaur must not be run as root, but pacdiff must be
alias pacmatic='pacdiff_program="sudo pacdiff" pacmatic'

# fasd initialization
eval "$(fasd --init auto)"

# GOLANG
export GOPATH=${GOPATH:-$HOME/go}

export PATH="${HOME}/.local/bin:${PATH}"

# tabtab source for serverless package
  # uninstall by removing these lines or running `tabtab uninstall serverless`
  [[ -f /home/henrique/.nvm/versions/node/v10.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/henrique/.nvm/versions/node/v10.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
  # tabtab source for sls package
    # uninstall by removing these lines or running `tabtab uninstall sls`
    [[ -f /home/henrique/.nvm/versions/node/v10.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/henrique/.nvm/versions/node/v10.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# Added by Krypton
export GPG_TTY=$(tty)

# Yarn Config
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Zsh fpath config
fpath+=${ZDOTDIR:-~}/.zsh_functions

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/henrique/.nvm/versions/node/v11.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/henrique/.nvm/versions/node/v11.10.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh