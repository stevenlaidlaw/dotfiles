# Path to your oh-my-zsh installation.
export ZSH="/home/stevenlaidlaw/.oh-my-zsh"

ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source "/etc/profile.d/rvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/usr/local/go/bin:/$home/.gem/bin

# User configuration

alias ll='ls -lah'

# PROGRAMS
alias vi='nvim'
alias vim='nvim'
alias bat='batcat'

# Helpers
alias pushall='git add . && git commit -m "`date`" && git push'
alias run='docker run -it --rm -u $(id -u ${USER}):$(id -g ${USER}) -v "/home/steven/:/home/steven/" -w "$PWD"'

eval "$(rbenv init -)"
