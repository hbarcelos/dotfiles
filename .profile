export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"#

# GOLANG
export GOPATH=${GOPATH:-$HOME/go}

export PATH="${HOME}/.local/bin:${HOME}/.cargo/bin:${PATH}"

# Yarn Config
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH:$HOME/.local/bin:$PATH"

# Java config
export JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStore=/etc/ssl/certs/java/cacerts"
export _JAVA_OPTIONS="${JAVA_OPTS}"

# Maven config
export M2_HOME=/opt/maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"

# Python config
export PYTHONPATH=$(python -c "import site, os; print(os.path.join(site.USER_BASE, 'lib', 'python', 'site-packages'))"):$PYTHONPATH

# Volta config
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
. "$HOME/.cargo/env"
