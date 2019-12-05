export ZSH="/home/steven/.oh-my-zsh"

ZSH_THEME="refined"

ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

# User configuration

# For a full list of active aliases, run `alias`.
alias ll='ls -lah'
alias please='sudo'
alias vi="nvim"
alias vim="nvim"
alias sb="cd ~/workspace/seqta && ./gradlew build -x test && cd seqta-suite && docker-compose up -d && cd .."
alias todo="~/Projects/todo.txt_cli/todo.sh"

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/gopath
export PATH=$PATH:$GOPATH:$GOPATH/bin
