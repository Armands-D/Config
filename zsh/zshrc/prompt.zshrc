## -- Git Prompt
autoload -Uz vcs_info
precmd_vcs_info () { vcs_info }
precmd_functions+=( precmd_vcs_info ) 
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

function zle-line-init zle-keymap-select {
    ## -- Alacritty VIM mode
    ## Right side prompts for vi mode status
    # RPS1="%F{#c678dd}%B${${KEYMAP/vicmd/}/(main|viins)/}%b%f"
    # RPS2=$RPS1
    ## vi mode status
    #
    #
    bold=$(tput bold)
    normal=$(tput sgr0)

    # https://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text
    autoload -U colors && colors

    usr="%F{green}U: %n%f"

    dir="%F{blue}D: %1~%f"

    git_str="FAILED TO SET GIT STR"
    if [ -z $vcs_info_msg_0_ ];then git_str="G: {}";else git_str="G: { $vcs_info_msg_0_ }";fi;
    git="%F{yellow}$git_str %f"

    vim="%F{magenta}%BV: -[${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}]-%b%f"

    py_venv="FAILED TO SET PY VENV STR"
    if [ -z $VIRTUAL_ENV ];then py_venv="P: ()";else py_venv="P: ${VIRTUAL_ENV_PROMPT}";fi;

    PS1="${bold}$usr | $dir | $git | $vim | $py_venv"$'\n'"$: "
    zle reset-prompt
}

