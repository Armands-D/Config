## -- SSH Agent
if [[ ! $( ps -lp $SSH_AGENT_PID 2> /dev/null ) ]]; then
    eval "$(ssh-agent -s)" # > /dev/null
fi

## -- SSH Keys
ssh-add ~/.ssh/github  2> /dev/null
ssh-add ~/.ssh/gitlabs  2> /dev/null

## -- Add snaps to application path
emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'

## -- autojump : cd alternative
## https://github.com/wting/autojump
##[[ -s /home/armands/.autojump/etc/profile.d/autojump.sh ]] && source /home/armands/.autojump/etc/profile.d/autojump.sh # non brew source
[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh # homebrew source

#$ -- Zoxide (autojump alternative)
eval "$(zoxide init zsh)" # after compinit

## TMUX
## https://wiki.archlinux.org/title/Tmux#Start_tmux_on_every_shell_login
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} > /dev/null 2>&1
    exec tmux new-window > /dev/null 2>&1
fi

## -- Kitty Shell Integration
# https://sw.kovidgoyal.net/kitty/shell-integration/#manual-shell-integration
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

