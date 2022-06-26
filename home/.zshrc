export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"

plugins=(git asdf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

. /opt/homebrew/opt/asdf/libexec/asdf.sh

alias ll='ls -lah'
alias vi='nvim'
alias vim='nvim'

alias pushall='git add . && git commit -m "`date`" && git push'

