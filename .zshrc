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
alias cl="clear"
alias viminstall="vim +PluginInstall +qall"
alias psqllocal="psql -h localhost"
alias mongostart="mongod --fork --config /usr/local/etc/mongod.conf"
alias b2d="boot2docker"
alias tmux="tmux attach -t base || tmux new -s base"
alias docker_shell="boot2docker shellinit"
alias dk="docker"
alias dkc="docker-compose"
alias dkm="docker-machine"
alias ll="ls -lh"
alias la="ls -A"

export PATH="/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin"
export PATH=${PATH}:/Applications/Android\ Studio.app/sdk/platform-tools
export PATH=${PATH}:/Applications/Android\ Studio.app/sdk/tools
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.composer/vendor/bin
export PATH=/Applications/MAMP/bin/php/php5.6.7/bin:$PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

. ~/Stuffs/z/z.sh
# source kvm.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

code () {
	if [[ $# = 0 ]]
	then
		open -a "Visual Studio Code"
	else
		[[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
		open -a "Visual Studio Code" --args "$F"
	fi
}
