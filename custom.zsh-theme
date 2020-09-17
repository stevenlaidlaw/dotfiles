# vim:ft=zsh ts=2 sw=2 sts=2

function get_region_and_rails_env() {
  if [[ "$PWD" =~ "workspace/website" ]]; then
    if [ "$RAILS_ENV" = "" ]; then
      rails_env="DEV"
    else
      rails_env="$RAILS_ENV:u"
    fi

    if [[ "$AGW_region" = "" ]]; then
      region=":AU"
    else
      region=":$AGW_region:u"
    fi

    if [[ -v "$AGW_database_name" ]]; then
      db=":$AGW_database_name"
    fi

    echo " %{$FG[013]%}$rails_env$region$db%{$reset_color%}"
  else
    return
  fi
}

function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}%{$FG[009]%}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" %{%B$FG[010]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{%B$FG[009]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

PROMPT='
%{%B$FG[012]%}%~%{$reset_color%}$(get_region_and_rails_env)$(my_git_prompt_info)
%% '

RPROMPT='$(ruby_prompt_info)'

