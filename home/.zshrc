# ZSH Stuff
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"
plugins=(asdf)
source $ZSH/oh-my-zsh.sh

if [[ "$CODESPACES" != "true" ]]; then
	export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
	export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
	export PATH="MGFXC_WINE_PATH=$HOME/.winemonogame:$PATH"
fi

if [[ "$GITHUB_REPOSITORY" == "github/github" ]]; then
	export GIT_TRACE_PERFORMANCE=1
fi

# Disable zsh vcs_info/git prompt in the github/github repo (large history causes slowdowns)
chpwd_disable_git_prompt() {
	if [[ "$PWD" == "$HOME/workspace/github/github"* ]]; then
		git config --global oh-my-zsh.hide-status 1
		git config --global oh-my-zsh.hide-dirty 1
	else
		git config --global --unset oh-my-zsh.hide-status 2>/dev/null
		git config --global --unset oh-my-zsh.hide-dirty 2>/dev/null
	fi
}
chpwd_functions+=(chpwd_disable_git_prompt)
chpwd_disable_git_prompt  # run once at shell startup

export PATH="$PATH:$(go env GOPATH)/bin"

# Git config stuff
git config --global pager.branch false

# Aliases
alias ll='ls -lah'
alias bat='bat --theme=gruvbox-dark -P'

alias gbr='git branch'
alias gco='git checkout'
alias gfe='git fetch'
alias gcm='git commit -m'
alias gpl='git pull'
alias gps='git push'
alias gfo='git fetch origin'
alias gmo='git merge origin/master'
alias gitclean="git branch | grep -v '^\*' | xargs git branch -D"

alias pushall='git add . && git commit -m "`date`" && git push'

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

