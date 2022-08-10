sync-up:
	cp ~/.oh-my-zsh/themes/custom.zsh-theme home/.oh-my-zsh/themes/custom.zsh-theme
	cp ~/.config/nvim/init.vim home/.config/nvim/init.vim
	cp ~/.zshrc home/.zshrc
	cp ~/.vale.ini home/
	cp ~/.config/alacritty.yml home/.config/

sync-down:
	rm **/.DS_Store
	rsync -aivP home/ ~/
