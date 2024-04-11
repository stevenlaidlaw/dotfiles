#!/bin/bash
echo "Attempting dotfiles install..."

# Always want to use ZSH as my default shell (e.g. for SSH)
sudo chsh -s /bin/zsh $(whoami)

#Sync dotfiles
rsync -aivP home/.zshrc ~/.zshrc
rsync -aivP home/.oh-my-zsh/ ~/.oh-my-zsh/

echo "Done installing dotfiles!"
