#!/bin/bash

echo "Attempting dotfiles install..."

# Always want to use ZSH as my default shell (e.g. for SSH)
sudo chsh -s /bin/zsh $(whoami)

# Install zsh addons
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Install default .tmux config
git clone https://github.com/gpakosz/.tmux ~/.tmux && ln -s -f .tmux/.tmux.conf ~/.tmux.conf && cp ~/.tmux/.tmux.conf.local ~/

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node
nvm use node

 #Sync dotfiles
rsync -aivP home/ ~/
# Install prettier
npm i --global prettier

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# Create session folder for vim sessions
mkdir ~/.sessions/

echo "Done installing dotfiles!"
