# ZSH Stuff
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"
plugins=(asdf)
source $ZSH/oh-my-zsh.sh

if [[ "$CODESPACES" != "true" ]]; then
	export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
	export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fi

# Git config stuff
git config --global pager.branch false

# Aliases
alias ll='ls -lah'
alias bat='bat --theme=gruvbox-dark -P'

alias gb='git branch'
alias gc='git checkout'
alias gf='git fetch'
alias gcm='git commit -m'
alias gpl='git pull'
alias gps='git push'
alias gfo='git fetch origin'
alias gmo='git merge origin/master'

alias pushall='git add . && git commit -m "`date`" && git push'
