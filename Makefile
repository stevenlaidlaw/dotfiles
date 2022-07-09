sync-up:
	cp ~/.oh-my-zsh/themes/custom.zsh-theme home/.oh-my-zsh/themes/custom.zsh-theme
	cp ~/.config/nvim/init.vim home/.config/nvim/init.vim
	cp ~/.zshrc home/.zshrc
	cp ~/Pictures/sushi.jpg home/Pictures/
	cp ~/Pictures/Background.png home/Pictures/
	cp ~/Pictures/Background.xcf home/Pictures/
	cp ~/.vale.ini home/
	cp ~/.config/alacritty.yml home/.config/

sync-down:
	rsync -aivP home/ ~/
