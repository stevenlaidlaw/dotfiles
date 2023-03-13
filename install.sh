#!/bin/bash

echo "Attempting dotfiles install..."

# Always want to use ZSH as my default shell (e.g. for SSH)
sudo chsh -s /bin/zsh $(whoami)

# Install zsh addons
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Install alacritty terminfo
wget https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info && tic -xe alacritty,alacritty-direct alacritty.info
rm alacritty.info

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
# Install yarn
npm i --global yarn

# Create session folder for vim sessions
mkdir ~/.sessions/

# Special for codespaces
if [[ "$CODESPACES" == "true" ]]; then
	# Get the latest version of vim
	cd /tmp
	git clone git@github.com:vim/vim.git
	cd vim
	sudo make && sudo make install && sudo cp /usr/local/bin/vim /usr/bin/vim.basic
fi

echo "Done installing dotfiles!"
