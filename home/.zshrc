export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"

plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

if [[ "$CODESPACES" != "true" ]]; then
	. /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

alias ll='ls -lah'
alias vi='nvim'
alias vim='nvim'
alias vig='vi +Goyo +Limelight'
alias bat='bat --theme=gruvbox-dark -P'

alias pushall='git add . && git commit -m "`date`" && git push'

export PATH="$HOME/workspace/stevenlaidlaw/dotfiles/scripts/:$PATH"

if [[ -z "$TMUX" ]] && [[ "$CODESPACES" != "true" ]]; then
	tmux attach-session -t ssh_tmux || tmux new-session -s home
fi
