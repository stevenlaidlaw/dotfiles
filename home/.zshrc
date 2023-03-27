export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"

if [[ "$CODESPACES" != "true" ]]; then
	plugins=(asdf zsh-autosuggestions)
else
	plugins=(asdf)
fi

source $ZSH/oh-my-zsh.sh

if [[ "$CODESPACES" != "true" ]]; then
	# OSX Only stuff
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
alias gfe='git fetch'
alias gme='git merge'
alias gpl='git pull'
alias gps='git push'
alias gbr='git branch'
alias gst='git stash'
alias gsta='git stash apply'

alias pushall='git add . && git commit -m "`date`" && git push'

export PATH="$HOME/workspace/stevenlaidlaw/dotfiles/scripts/:$PATH"

# Copilot CLI Shortcuts (??, git?, gh?)
eval "$(github-copilot-cli alias -- "$0")"

