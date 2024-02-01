function color() {
  if [[ "$1" = "black" ]]; then
    echo $FG[000]
  elif [[ "$1" = "red" ]]; then
    echo $FG[001]
  elif [[ "$1" = "green" ]]; then
    echo $FG[002]
  elif [[ "$1" = "yellow" ]]; then
    echo $FG[003]
  elif [[ "$1" = "blue" ]]; then
    echo $FG[004]
  elif [[ "$1" = "magenta" ]]; then
    echo $FG[005]
  elif [[ "$1" = "cyan" ]]; then
    echo $FG[006]
  elif [[ "$1" = "white" ]]; then
    echo $FG[007]
  elif [[ "$1" = "gray" ]]; then
    echo $FG[008]
  elif [[ "$1" = "brightred" ]]; then
    echo $FG[009]
  elif [[ "$1" = "brightgreen" ]]; then
    echo $FG[010]
  elif [[ "$1" = "brightyellow" ]]; then
    echo $FG[011]
  elif [[ "$1" = "brightblue" ]]; then
    echo $FG[012]
  elif [[ "$1" = "brightmagenta" ]]; then
    echo $FG[013]
  elif [[ "$1" = "brightcyan" ]]; then
    echo $FG[014]
  elif [[ "$1" = "brightwhite" ]]; then
    echo $FG[015]
  fi
}

function reset() {
  echo $reset_color
}

function decor() {
  echo "$(color brightmagenta)%B$1$(reset)"
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

function get_codespaces_prompt() {
  if [[ "$CODESPACES" = "true" ]]; then
    PROMPT+="%B$(color brightyellow)codespace $CODESPACE_NAME"
  fi
}

function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	GIT_STATUS=""
  if [[ "$CODESPACES" != "true" ]]; then
		GIT_STATUS=$(git_prompt_status)
	fi
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS" # add a space if there is a status
  echo " %B$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(color brightred)$GIT_STATUS"
}

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX="$(color brightgreen)\uE0A0"
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Left prompt
PROMPT='
'
$(get_codespaces_prompt)
PROMPT+='$(color brightblue)%B%~$(my_git_prompt_info)
$(decor $) '

# Right prompt
RPROMPT=""

