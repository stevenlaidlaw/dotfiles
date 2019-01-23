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

# User configuration

# For a full list of active aliases, run `alias`.
alias ll='ls -lah'
alias please='sudo'
alias lock='i3lock -i /home/steven/Pictures/backgrounds/msmarvel.png -t -f'
alias nightnight='sudo sh -c "echo mem > /sys/power/state"'
alias vi="nvim"
alias vim="nvim"
