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
[[ -s /home/armands/.autojump/etc/profile.d/autojump.sh ]] && source /home/armands/.autojump/etc/profile.d/autojump.sh

