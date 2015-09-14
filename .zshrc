#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=/Applications/MAMP/bin/php/php5.6.2/bin/:$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
alias cl="clear"
alias viminstall="vim +PluginInstall +qall"
alias startApache="/Applications/MAMP/bin/startApache.sh"
alias stopApache="/Applications/MAMP/bin/stopApache.sh"
alias b2d="boot2docker"
alias dk="docker"
alias tmux="tmux attach -t base || tmux new -s base"
alias dkc="docker-compose"
alias dkm="docker-machine"
alias ll="ls -lh"
alias la="ls -A"

. ~/Stuff/z/z.sh
