PROMPT="%B%(?:%{$fg[yellow]%}❯ :%{$FG[125]%}❯ )%b"
PROMPT+='%B%{$fg[blue]%}%D{%a %d/%m/%y} %{$fg[green]%}%1/%{$reset_color%} $(git_prompt_info)%b'
PROMPT+='%B%(?:%{$fg[yellow]%}❯ :%{$FG[125]%}❯ )%{$reset_color%}%b'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$FG[214]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %B%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %B%{$fg_bold[green]%}+"
