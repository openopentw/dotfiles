alias ssh-csie='ssh-csie.sh'
alias sftp-csie='sftp-csie.sh'

# alias tmux="TERM=screen-256color-bce tmux"
alias tmux="tmux -2"

TERM=screen-256color

# auto record the directory we last visited
if [ -t 1 ] && [ $(pwd) == $HOME ]; then
	# Only in terminal and in home-dir do this.
	last_position=$(cat ~/.last_position)
	cd "$last_position"
	# cd desktop
    ls --color=auto
fi

# alias c="cd ~/desktop"
c() {
	if [[ $# -eq 1 ]]; then
		cd "$1"
	else
		cd ~/desktop
	fi
    ls --color=auto
	# for next login use
	pwd > ~/.last_position
}
alias c..="c .."

alias v="vim"
alias p="python3"
