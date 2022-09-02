#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export TERM=alacritty

# ALIAS
alias v="vim"
alias pin="sudo pacman -S "
alias source="source /home/armands/.bashrc && neofetch"
alias clr="clear"

if [ ! $( ps -p $SSH_AGENT_PID > /dev/null) ]
then
eval "$(ssh-agent -s)" > /dev/null
	ssh-add ~/.ssh/gitlabs 2> /dev/null
	ssh-add ~/.ssh/github 2> /dev/null
fi
