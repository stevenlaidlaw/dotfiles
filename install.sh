#!/bin/sh

# Always want to use ZSH as my default shell (e.g. for SSH)
sudo chsh -s /bin/zsh vscode

if [[ "$CODESPACES" == "true" ]]; then
	git config --global --add oh-my-zsh.hide-status 1
fi

# Sync dotfiles
rsync -aivP home/ ~/
# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +'PlugInstall --sync' +qa
# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Install default .tmux config
git clone https://github.com/gpakosz/.tmux ~/.tmux && ln -s -f .tmux/.tmux.conf ~/.tmux.conf && cp ~/.tmux/.tmux.conf.local ~/
