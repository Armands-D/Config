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

# Remove for autocomplete repo purposes
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# End of lines added by compinstall

# Aliases
alias ls="exa -al --header"
alias cat='bat -p '
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
#alias as="~/android-studio/bin/studio.sh > /dev/null 2>&1 &"
alias studio="studio.sh"
alias postman="snap run postman > /dev/null 2>&1 &"
#alias discord="discord > /dev/null 2>&1 &"
alias pin='function(){sudo pacman -S $@ || yay -S $@}'
alias mkdir='mkdir -pv'
alias pup='sudo pacman -S archlinux-keyring; sudo pacman -Syu'
alias pls='sudo pacman -Q'
alias mv='mv -i '
alias cp='cp -i '
alias rm='rm -rf '
alias usblive='/opt/balenaEtcher/balena-etcher-electron > /dev/null 2>&1 &'
alias pdf='/opt/sejda-desktop/sejda-desktop > /dev/null 2>&1 &'
alias bashrc="v ~/.bashrc"
alias zshrc="v ~/.zshrc"
alias srcsh="source ~/.bashrc && source ~/.zshrc"
alias bright='light -S ' #'sudo xbacklight -display 1 '
alias wifi-connect="wifi_connect.sh"
alias hotspot-connect='nmcli device wifi connect Galaxy\ Thonk\ S20\ FE password Armbandy'
alias hack='cmatrix -a'
alias audio='alsamixer'
alias img='function (){fim -a $1 &}'
alias number-wallpapers="~/Scripts/wallpaper_number.sh"
alias sd='sudo systemctl'
alias sd-enable='sudo systemctl enable '
alias sd-disable='sudo systemctl disable '
alias sd-start='sudo systemctl start '
alias sd-stop='sudo systemctl stop '
alias sd-reload='sudo systemctl daemon-reload'
alias sd-reset-failed='sudo systemctl reset-failed'
alias sd-status='sudo systemctl status'
alias logoff='pkill -KILL -u $USER'
alias wget='sudo wget '
alias cmd='command '
alias brain='Obsidian-1.0.3.AppImage &' 
alias term='alacritty --working-directory $PWD &'
alias py='python '
alias ipy='ipython '
alias pwr='sudo powertop'
alias docker='sudo docker '
# Config Aliases for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# Antlr Aliases
# alias antlr4='java -jar /usr/local/lib/antlr-4.11.1-complete.jar'
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.11.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.11.1-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig' alias grun='java org.antlr.v4.gui.TestRig'

# ENV
alias term='alacritty --working-directory $PWD &'
alias py='python '
alias ipy='ipython '
alias tt='temp_tool'

# ENV
# .local/bin for user pip installs
export PATH=/home/armands/Scripts/:/sbin/:/home/armands/android-studio/bin/:/home/armands/.local/bin:$PATH
export EDITOR=/usr/bin/nvim
export CLASSPATH=".:/usr/local/lib/antlr-4.11.1-complete.jar:$CLASSPATH"

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
    bold=$(tput bold)
    normal=$(tput sgr0)
    pink="#c678dd" 
    green="#5fd75f" 
    blue="#00afaf" 
    orange="#ffaf00" 
    # vim="%F{#d3869b}%B-[${${KEYMAP/vicmd/}/(main|viins)/🖍} ]-%b%f"
    vim="%F{#d3869b}%B-[${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}]-%b%f"
    usr="%F{#a9b665} %n%f"
    dir="%F{#7daea3}  %1~%f"
    git_str="FAILED TO SET GIT STR"
    if [ -z $vcs_info_msg_0_ ];then git_str="-⊰⊱-";else git_str="-⊰ $vcs_info_msg_0_ ⊱-";fi;
    git="%F{#d8a657}  $git_str %f"
    PS1="${bold}$usr $dir $git $vim"$'\n'"  "
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# SSH Agent
if [ ! $( ps -lp $SSH_AGENT_PID 2> /dev/null ) ]
then
    eval "$(ssh-agent -s)" > /dev/null
    ssh-add ~/.ssh/gitlabs 2> /dev/null
    ssh-add ~/.ssh/github 2> /dev/null
fi

echo
neofetch

 # Python Click Auto Complete
 # Doc: https://click.palletsprojects.com/en/8.1.x/shell-completion/#enabling-completion
 # Repo: https://github.com/Armands-D/TemplateTool
eval "$(_TEMP_TOOL_COMPLETE=zsh_source temp_tool)"

