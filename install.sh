#!/bin/bash

echo "Attempting dotfiles install..."

# Always want to use ZSH as my default shell (e.g. for SSH)
sudo chsh -s /bin/zsh $(whoami)

# Install zsh addons
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Install default .tmux config
git clone https://github.com/gpakosz/.tmux ~/.tmux && ln -s -f .tmux/.tmux.conf ~/.tmux.conf && cp ~/.tmux/.tmux.conf.local ~/

# Sync dotfiles
rsync -aivP home/ ~/
# Install prettier
npm i --global prettier

if [[ "$CODESPACES" = "true" ]]; then
	echo "Running in a codespace..."
	git config --global --add oh-my-zsh.hide-status 1
	yes | sudo apt install neovim
fi

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +'PlugInstall --sync' +qa

# Create session folder for vim sessions
mkdir ~/.sessions/

echo "Done installing dotfiles!"
