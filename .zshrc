# Path to your oh-my-zsh installation.
export ZSH="/home/steven/.oh-my-zsh"

ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# User configuration

# PROGRAMS
alias vi='nvim'
alias vim='nvim'
alias python='/usr/local/bin/python3'
alias pip='/usr/local/bin/pip3'
alias bat='batcat'

# Helpers
alias pushall='git add . && git commit -m "`date`" && git push'

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
