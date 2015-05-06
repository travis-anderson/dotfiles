function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

#use extended color pallete if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    orange="%F{166}"
    lessgreen="%F{71}"
    deeppurple="%F{054}"
    gray="%F{008}"
else
    orange="$fg[yellow]"
    lessgreen="$fg[green]"
    deeppurple="$fg[purple]"
    gray="$fg[white]"
fi

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function show_colors {
  for code in {000..255}
    do print -P -- "$code: %F{$code}Test%f"
  done
}

PROMPT='
%{$gray%}%D{%a %e-%b-%Y %k:%M}%{$reset_color%} %{$deeppurple%}%n@$(box_name)%{$reset_color%}
%{$lessgreen%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)  
%{%F{23}%}䷖ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=":%{$orange%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$orange%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$orange%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
RPROMPT='$(virtualenv_info)%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )${return_status}%{$reset_color%} [%{$fg[red]%}$(chruby_prompt_info)%{$reset_color%}]'
