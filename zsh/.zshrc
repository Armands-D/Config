# ZSH autocomplete: https://github.com/marlonrichert/zsh-autocomplete
# source ~/Source/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
unsetopt extendedglob 
setopt nomatch
setopt notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

# Remove for autocomplete repo purposes
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# End of lines added by compinstall

zle -N zle-line-init
zle -N zle-keymap-select

## Source Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

## -- Source zshrc folder
for FILE in $HOME/zshrc/* ; do
    source $FILE
done

echo

neofetch
fortune -s | cowsay -y | lolcat --spread 10
