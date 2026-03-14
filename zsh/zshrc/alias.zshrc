## -- Aliases

## Common
alias eza="eza -al --icons --no-time --no-user -B --total-size"
alias ls="eza" # ls alternative
alias bat='batcat'
alias cat='bat -p'
alias clr="clear"
alias mv='mv -i'
alias cp='cp -ir'
alias rm='rm -rf'
alias mkdir='mkdir -pv'
alias cmd='command'


# Display control characters, no caret notation
# https://unix.stackexchange.com/questions/280419/how-to-use-less-in-a-script-without-getting-esc-escape-characters
alias less='less -R'
alias rr=". ranger" # cli directory navigation
#alias cd='j' # cd alternative

## System Package Manager (Ubuntu)
alias pin='sudo apt install'
alias pup='sudo apt update && sudo apt upgrade'
alias pls='sudo apt list'

## System Package Manager (Arch)
#alias pin='function(){sudo pacman -S $@ || yay -S $@}'
#alias pup='sudo pacman -S archlinux-keyring; sudo pacman -Syu'
#alias pls='sudo pacman -Q'

## Dev
alias py='python'
alias py3='python3'
alias py312='python3.12'
alias ipy='ipython' # interactive python

alias docker='sudo docker'
alias npm="sudo npm"
alias wget='sudo wget'
alias n="sudo n" # npm manager
alias python='python3'

## Git

alias ga="git add *"
alias gc="_gc" 
alias gbls="git branch --all"
alias gl='git log'
alias gto="git checkout -b"
alias gst="git status"
alias gpl="git pull"
alias gps="git fetch && git push"
alias gto="git checkout"
alias gri="git rebase -i"
alias gr='git rebase'
alias grsts='git reset --soft'
alias grsth='git reset --hard'

## Apps
alias v="$HOME/Scripts/sudo_editor.sh"
alias ff="firefox"
alias fm="thunar"
alias audio='alsamixer'
alias img='function (){fim -a $1 &}'
alias term='alacritty --working-directory $PWD &'
alias pwr='sudo powertop'

#alias as="$HOME/android-studio/bin/studio.sh > /dev/null 2>&1 &"
#alias studio="studio.sh"
#alias postman-agent="postman-agent > /dev/null 2>&1 &"
#alias postman="postman > /dev/null 2>&1 &"
#alias discord="discord > /dev/null 2>&1 &"
#alias usblive='/opt/balenaEtcher/balena-etcher-electron > /dev/null 2>&1 &'
#alias pdf='/opt/sejda-desktop/sejda-desktop > /dev/null 2>&1 &'

## Shell RCs
alias bashrc="v $HOME/.bashrc"
alias zshrc="v $HOME/.zshrc"
alias srcsh="source $HOME/.bashrc && source $HOME/.zshrc"
alias srczsh="source $HOME/.zshenv && source $HOME/.zshrc "
alias srcbash="source $HOME/.bashrc"

## System
alias off="shutdown now"
alias reboot="sudo reboot now"

alias sd='sudo systemctl'
alias sd-enable='sudo systemctl enable '
alias sd-disable='sudo systemctl disable '
alias sd-start='sudo systemctl start '
alias sd-stop='sudo systemctl stop '
alias sd-reload='sudo systemctl daemon-reload'
alias sd-reset-failed='sudo systemctl reset-failed'
alias sd-status='sudo systemctl status'

## Laptop
# alias bright='light -S ' #'sudo xbacklight -display 1 '
# alias wifi-connect="wifi_connect.sh"
# alias hotspot-connect='nmcli device wifi connect Galaxy\ Thonk\ S20\ FE password Armbandy'
# alias logoff='pkill -KILL -u $USER'

## Misc
alias hack='cmatrix -a'
alias number-wallpapers="$HOME/Scripts/wallpaper_number.sh"
alias tt='temp_tool'

## Config Aliases for dotfiles
# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

## Antlr Aliases
# alias antlr4='java -jar /usr/local/lib/antlr-4.11.1-complete.jar'
#alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.11.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
#alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.11.1-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig' alias grun='java org.antlr.v4.gui.TestRig'
