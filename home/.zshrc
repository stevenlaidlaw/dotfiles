export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"

if [[ "$CODESPACES" != "true" ]]; then
	plugins=(git asdf)
else
	plugins=(git asdf)
fi

source $ZSH/oh-my-zsh.sh

# OSX Only stuff
if [[ "$CODESPACES" != "true" ]]; then
	. /opt/homebrew/opt/asdf/libexec/asdf.sh
	export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
fi

function session() {
	local cwd=$(pwd)
	local cwd=${cwd:1} # remove leading slash
	local cwd=${cwd//\//_} # replace slashes with underscores
	local session_file="~/.sessions/$cwd"
	vim -S $session_file
}

alias ll='ls -lah'
alias bat='bat --theme=gruvbox-dark -P'
alias gcl='git clone'
alias gco='git checkout'
alias gcm='git commit -m'
alias gpl='git pull'
alias gps='git push'
alias gbr='git branch'
alias gst='git stash'
alias gsta='git stash apply'

alias pushall='git add . && git commit -m "`date`" && git push'

export PATH="$HOME/workspace/stevenlaidlaw/dotfiles/scripts/:$PATH"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

