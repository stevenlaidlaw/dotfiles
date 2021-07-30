function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}%{$FG[009]%}$GIT_STATUS"
}

function get_aws_vault_and_region() {
  if [[ "$AWS_VAULT" = "" ]]; then
    return
  else
    echo " %{$FG[006]%}$AWS_VAULT | $AWS_REGION"
  fi
}

function get_aws_profile() {
  C1="%{$FG[005]%}"
  C2="%{$FG[005]%}"
  echo " :$C1$AWS_PROFILE%{$reset_color%}:$C1$AWS_REGION"
}

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" %{%B$FG[010]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Left prompt
PROMPT='
%{%B$FG[012]%}%~%{$reset_color%}$(my_git_prompt_info)%{$reset_color%}
%% '
# ∑∆∞§¶

# Right prompt
RPROMPT='$(get_aws_profile)%{$reset_color%}'

