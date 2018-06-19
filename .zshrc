# Configuration of global environment variables
export DISABLE_AUTO_TITLE=true
export EDITOR='vim'

if [ -f ~/antigen.zsh ]; then

  source ~/antigen.zsh
  # Load the oh-my-zsh's library.
  antigen use oh-my-zsh

  # Bundles from the default repo (robbyrussell's oh-my-zsh).

  # bgnotify_threshold=4  ## set your own notification threshold
  # function bgnotify_formatted {
  #   ## $1=exit_status, $2=command, $3=elapsed_time
  #   [ $1 -eq 0 ] && title="Holy Smokes Batman!" || title="Holy Graf Zeppelin!"
  #   bgnotify "$title -- after ${3}s" "$2";
  # }
  # antigen bundle bgnotify

  # export NVM_LAZY_LOAD=true
  export NVM_AUTO_USE=true
  antigen bundle lukechilds/zsh-nvm

  export ZSH_TMUX_AUTOSTART=true
  export ZSH_TMUX_AUTOSTART_ONCE=true
  antigen bundle tmux

  antigen bundle aws
  antigen bundle cp
  antigen bundle command-not-found
  antigen bundle docker
  antigen bundle docker-compose
  antigen bundle dotenv
  antigen bundle fasd
  antigen bundle git
  antigen bundle git-extras
  antigen bundle Seinh/git-prune
  antigen bundle node
  antigen bundle npm
  # antigen bundle npx
  antigen bundle nvm
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle chrissicool/zsh-256color
  antigen bundle djui/alias-tips
  antigen bundle hlissner/zsh-autopair
  antigen bundle Tarrasch/zsh-colors
  antigen bundle Vifon/deer
  antigen bundle webyneter/docker-aliases.git
  antigen bundle MichaelAquilina/zsh-emojis

  # Load the theme.
  # antigen theme robbyrussell
  antigen theme NelsonBrandao/absolute absolute

  # Tell Antigen that you're done.
  antigen apply

  # fasd config
  alias j='fasd_cd -d'

  # Deer config
  autoload -U deer
  zle -N deer
  bindkey '\ek' deer

  # ZSH autosuggestions config
  bindkey '^ ' autosuggest-accept
else
  echo -e "Please install antigen:\n"
  echo -e "    curl -L git.io/antigen > antigen.zsh\n"
fi

# pacaur, yaourt, makepkg: use powerpill instead of pacman
pacman -Q powerpill >& /dev/null && export PACMAN=/usr/bin/powerpill

# pacmatic: use pacaur instead of pacman
# s/pacaur/yaourt/g if desired
pacman -Q yaourt >& /dev/null && export pacman_program=/usr/bin/yaourt

# pacaur must not be run as root, but pacdiff must be
alias pacmatic='pacdiff_program="sudo pacdiff" pacmatic'

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fasd initialization
eval "$(fasd --init auto)"

# GOLANG
export GOPATH=${GOPATH:-$HOME/go}

export PATH="${HOME}/.local/bin:${PATH}"
