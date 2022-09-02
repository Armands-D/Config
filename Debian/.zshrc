# ZSH autocomplete: https://github.com/marlonrichert/zsh-autocomplete
# source ~/Source/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/armands/.zshrc'

# Remove for autocomplete repo purposes
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases
alias ls="exa -al --header"
alias ga="git add *"
alias gc="git commit -am "
alias gst="git status"
alias gpl="git pull"
alias gps="git push"
alias gal="git_script.sh"
alias gto="git checkout "
alias v="~/Scripts/sudo_editor.sh"
alias off="shutdown now"
alias reboot="sudo reboot now"
alias ff="firefox"
alias fm="thunar"
alias clr="clear"
alias as="~/android-studio/bin/studio.sh > /dev/null 2>&1 &"
alias studio="studio.sh"
alias postman="snap run postman > /dev/null 2>&1 &"
alias discord="discord > /dev/null 2>&1 &"
alias aptup='sudo apt update && sudo apt upgrade'
alias aptin='sudo apt install'
alias aptrm='sudo apt remove'
alias aptls='apt list --installed'
alias mkdir='mkdir -pv'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -rf'
alias usblive='/opt/balenaEtcher/balena-etcher-electron > /dev/null 2>&1 &'
alias pdf='/opt/sejda-desktop/sejda-desktop > /dev/null 2>&1 &'
alias bashrc="nv ~/.bashrc"
alias srcbash="source ~/.bashrc"
alias bright="~/Scripts/brightness.sh"
alias wifi-connect="wifi_connect.sh"
alias hack='cmatrix -a'
alias audio='alsamixer'
alias img='function (){fim -a $1 &}'
alias number-wallpapers="~/Scripts/wallpaper_number.sh"

# ENV
export PATH=/home/armands/Scripts/:/sbin/:/home/armands/android-studio/bin/:$PATH
export EDITOR=/usr/bin/nvim

# Git Prompt
autoload -Uz vcs_info
precmd_vcs_info () { vcs_info }
precmd_functions+=( precmd_vcs_info ) 
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

# Right side prompts for vi mode status
# RPS1="%F{#c678dd}%B${${KEYMAP/vicmd/}/(main|viins)/}%b%f"
# RPS2=$RPS1
PS1="$usr $dir $git $vim   "
function zle-line-init zle-keymap-select {
    # RPS1="%F{#c678dd}%B${${KEYMAP/vicmd/}/(main|viins)/}%b%f"
    # RPS2=$RPS1
    # vi mode status
    vim="%F{#c678dd}%B${${KEYMAP/vicmd/ }/(main|viins)/ }%b%f"
    usr="%F{#5fd75f}  %n%f"
    dir="%F{#00afaf}  %1~%f"
    git="%F{#ffaf00} $vcs_info_msg_0_%f"
    PS1="$usr $dir $git $vim"$'\n'"  "
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# SSH Agent
if [ ! $( ps -p $SSH_AGENT_PID > /dev/null) ]
then
    eval "$(ssh-agent -s)" > /dev/null
    ssh-add ~/.ssh/gitlabs 2> /dev/null
    ssh-add ~/.ssh/github 2> /dev/null
fi

# Rust Shell Setup
source "$HOME/.cargo/env"

xset r rate 200 30
xset +fp ~/.local/share/fonts
xset fp rehash

# Plugins
source ~/.zplug/init.zsh
zplug "jeffreytse/zsh-vi-mode"

echo
neofetch

