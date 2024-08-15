export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim
export GTK2_RC_FILES="${HOME}/.gtkrc-2.0"#

# GOLANG
export GOPATH="${GOPATH:-${HOME}/go}"

export PATH="${HOME}/.local/bin:${HOME}/.cargo/bin:${PATH}"

# Yarn Config
export PATH="${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:${PATH}:${HOME}/.local/bin:${PATH}"

[ -d ~/.zplug/repos/zplug/zplug/bin ] && \
  export PATH="~/.zplug/repos/zplug/zplug/bin:${PATH}"
[ -d ~/.zplug/bin ] && \
  export PATH="${HOME}/.zplug/bin:${PATH}"
[ -d ~/.zplug/repos/unixorn/bitbucket-git-helpers.plugin.zsh/bin ] && \
  export PATH="${HOME}/.zplug/repos/unixorn/bitbucket-git-helpers.plugin.zsh/bin:${PATH}"

# Python config
export PYTHONPATH="$(python -c "import site, os; print(os.path.join(site.USER_BASE, 'lib', 'python', 'site-packages'))"):${PYTHONPATH}"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# Volta config
export VOLTA_HOME="${HOME}/.volta"
export PATH="${VOLTA_HOME}/bin:${PATH}"

# QT config
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCREEN_SCALE_FACTORS=1
