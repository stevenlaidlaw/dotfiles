export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"

plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

if [[ "$CODESPACES" != "true" ]]; then
	. /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

alias ll='ls -lah'
alias vi='nvim'
alias vim='nvim'
alias vig='vi +Goyo +Limelight'
alias bat='bat -P'

alias pushall='git add . && git commit -m "`date`" && git push'

