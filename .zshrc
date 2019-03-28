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
alias lock='i3lock -i /home/steven/Pictures/backgrounds/msmarvel.png -t -f'
alias vi="nvim"
alias vim="nvim"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/steven/Projects/simpleMixer/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/steven/Projects/simpleMixer/node_modules/tabtab/.completions/electron-forge.zsh