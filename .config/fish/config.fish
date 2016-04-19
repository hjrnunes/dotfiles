# Homebrew
set -x PATH ""(brew --prefix)"/bin" $PATH
set -x PATH ""(brew --prefix coreutils)"/libexec/gnubin" $PATH

set -g -x PATH /usr/local/bin $PATH
set -g -x PATH /usr/local/sbin $PATH
set -g -x PATH $HOME/.local/bin $PATH

set -g -x CLASSPATH /Users/hjrnunes
set -g -x ARCHFLAGS "-arch x86_64"

set -g -x GIT_EDITOR "subl --wait --new-window"
set -Ux LSCOLORS Cxgxfxfxcxdxdxhbadbxbx

# pyenv stuff
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
set -g -x VIRTUAL_ENV_DISABLE_PROMPT 1

# docker stuff
set -g -x DOCKER_HOST tcp://192.168.99.100:2376
set -g -x DOCKER_CERT_PATH /Users/hjrnunes/.docker/machine/machines/dev
set -g -x DOCKER_TLS_VERIFY 1

# iterm2 integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# use latest Ruby + Gems
# set -x PATH "/usr/local/Cellar/ruby/2.0.0-p0/bin" "/usr/local/opt/ruby/bin" $PATH

# node (default)
# set -x NODE_PATH "/usr/local/lib/node" "/usr/local/lib/node_modules" $NODE_PATH

# node (current version, via n)
# n 0.12.7

# expose PATH to graphical apps
launchctl setenv PATH $PATH
