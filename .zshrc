# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

ZSH_THEME="custom"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export NVM_DIR="$HOME/.nvm"x
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PROGRAMS
alias vi='nvim'
alias vim='nvim'
alias python='/usr/local/bin/python3'
alias pip='/usr/local/bin/pip3'

# Helpers
alias pushall='git add . && git commit -m "`date`" && git push'

# FUN
alias noise='play -n synth brownnoise synth pinknoise mix synth 0 0 0 10 10 40 trapezium amod 0.1 30'
alias alarmnoise='play -n synth 0.04 sin 400 fade l 0 2 1 trim 0 0.11 repeat 2'
alias alarmsleep='alarmnoise;sleep 0.9;'
alias alarm='for i in {1..1000}; do alarmsleep; done'
alias please='sudo'

