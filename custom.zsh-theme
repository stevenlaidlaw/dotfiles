# vim:ft=zsh ts=2 sw=2 sts=2

function get_region_and_rails_env() {
  if [[ "$PWD" =~ "workspace/website" ]]; then
    if [ "$RAILS_ENV" = "" ]; then
      rails_env="%{$fg[magenta]%}E:%{$fg[yellow]%}DEV"
    else
      rails_env="%{$fg[magenta]%}E:%{$fg[yellow]%}$RAILS_ENV:u"
    fi

    if [[ "$AGW_region" = "" ]]; then
      region="%{$fg[magenta]%}R:%{$fg[yellow]%}AU"
    else
      region="%{$fg[magenta]%}R:%{$fg[yellow]%}$AGW_region:u"
    fi

    if [[ -v "$AGW_database_name" ]]; then
      db=" %{$fg[magenta]%}D:%{$fg[yellow]%}$AGW_database_name"
    fi

    echo " $rails_env $region$db%{$reset_color%}"
  else
    return
  fi
}

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

PROMPT='
%{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info)$(get_region_and_rails_env)
$ '

RPROMPT='$(ruby_prompt_info)'

