PROMPT="%B%(?:%{$fg[yellow]%}❯ :%{$fg[red]%}❯ )%b"
PROMPT+='%B%{$fg[blue]%}%D{%a %d/%m/%y} %{$fg[green]%}%1/%{$reset_color%} $(git_prompt_info)%b'
PROMPT+='%B%(?:%{$fg[yellow]%}❯ :%{$fg[red]%}❯ )%{$reset_color%}%b'

ZSH_THEME_GIT_PROMPT_PREFIX="%B%{$FG[072]%}(%{$FG[132]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%b "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[072]%}) %B%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[072]%}) %B%{$fg_bold[green]%}+"
