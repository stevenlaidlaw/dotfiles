# vim:ft=zsh ts=2 sw=2 sts=2

function get_region_and_rails_env() {
  if [[ "$PWD" =~ "workspace/website" ]]; then
    if [ "$RAILS_ENV" = "" ]; then
      rails_env_tmp=dev
    else
      rails_env_tmp=$RAILS_ENV
    fi

    if [[ -v "$AGW_database_name" ]]; then
      append_db_name_tmp=":$AGW_database_name"
    fi

    if [[ "$AGW_region" = "" || "$AGW_region" = "au" ]]; then
      region_tmp="au"
    else
      region_tmp="**$AGW_region:u**" # the :u converts the $AGW_region to uppercase in ZSH
    fi

    echo "%{$fg[yellow]%} | $region_tmp:$rails_env_tmp$append_db_name_tmp%{$reset_color%}"
  else
    return
  fi
}

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

PROMPT='
%{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info)$(get_region_and_rails_env)
$ '

RPROMPT='$(ruby_prompt_info)'

