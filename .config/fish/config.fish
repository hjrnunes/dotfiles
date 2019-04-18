# Homebrew
set -x PATH ""(brew --prefix)"/bin" $PATH
set -x PATH ""(brew --prefix coreutils)"/libexec/gnubin" $PATH

set -g -x PATH /usr/local/bin $PATH
set -g -x PATH /usr/local/sbin $PATH
set -g -x PATH $HOME/.local/bin $PATH
set -g -x PATH /Applications/MySQLWorkbench.app/Contents/MacOS $PATH

set -g -x CLASSPATH /Users/hjrnunes
set -g -x ARCHFLAGS "-arch x86_64"

set -g -x GIT_EDITOR "nano"
set -Ux LSCOLORS Cxgxfxfxcxdxdxhbadbxbx

# iterm2 integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Homebrew editor
set -gx HOMEBREW_EDITOR "subl --wait --new-window";

# Go
set -x -U GOPATH $HOME/workspace/sandbox/go

# expose PATH to graphical apps
launchctl setenv PATH $PATH
set -g fisher_home ~/.local/share/fisherman
set -g fisher_config ~/.config/fisherman
# source $fisher_home/config.fish

# pyenv
set -x PATH "/Users/hjrnunes/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
set -g -x VIRTUAL_ENV_DISABLE_PROMPT 1

# rbenv
set -x PATH "/Users/hjrnunes/.rbenv/bin" $PATH
status --is-interactive; and . (rbenv init -|psub)

# jenv
set -x PATH "/Users/hjrnunes/.jenv/bin" $PATH
status --is-interactive; and . (jenv init -|psub)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
