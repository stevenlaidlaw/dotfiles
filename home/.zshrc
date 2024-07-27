export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"
plugins=(asdf)

source $ZSH/oh-my-zsh.sh

if [[ "$CODESPACES" != "true" ]]; then
	# OSX Only stuff
	. /opt/homebrew/opt/asdf/libexec/asdf.sh
	export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
fi

alias ll='ls -lah'
alias bat='bat --theme=gruvbox-dark -P'
alias gcl='git clone'
alias gco='git checkout'
alias gcm='git commit -m'
alias gfe='git fetch'
alias gme='git merge'
alias gpl='git pull'
alias gps='git push'
alias gbr='git branch'
alias gst='git stash'
alias gsta='git stash apply'
alias gpm='git pull --rebase origin master'

alias pushall='git add . && git commit -m "`date`" && git push'
