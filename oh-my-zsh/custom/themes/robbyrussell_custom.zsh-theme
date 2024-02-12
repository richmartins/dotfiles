# lambda change with the output of stdout yellow if ok red if fails
#λ
PROMPT="%(?:%{$bg[green]%}~>:%{$bg[red]%}~>%s)%{$reset_color%}"
# arrow
##PROMPT+="%{$bg[blue]%}~>%{$reset_color%}"
# pwd with shrink_path plugin and git prompt info
PROMPT+=' %{$fg[yellow]%}$(shrink_path -l -t)%{$reset_color%} $(git_prompt_info)%# %b%f%k'
# git prompt info config
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

RPROMPT+='%{$fg[green]%}$(virtualenv_info)%{$reset_color%}'
RPROMPT+='%{$fg[red]%}$(ruby_version)%{$reset_color%}'


# time on the right of the prompt
RPROMPT+='%{$FG[239]%}[%T]%{$reset_color%}'
