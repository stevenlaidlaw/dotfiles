export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"

plugins=(git asdf)

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

alias pushall='git add . && git commit -m "`date`" && git push'

export PATH="$HOME/workspace/stevenlaidlaw/dotfiles/scripts/:$PATH"

if [[ -z "$TMUX" ]]; then
	if [[ "$CODESPACES" == "true" ]]; then
		#tmux attach -t remote || tmux new -s remote
	else
		tmux attach-session -t home || tmux new-session -s home
	fi
fi
