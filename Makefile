sync-up:
	cp ~/.oh-my-zsh/themes/custom.zsh-theme home/.oh-my-zsh/themes/custom.zsh-theme
	cp ~/.config/nvim/init.vim home/.config/nvim/init.vim
	cp ~/.config/kitty/kitty.conf home/.config/kitty/kitty.conf
	cp ~/.config/kitty/themes/* home/.config/kitty/themes/
	cp ~/.zshrc home/.zshrc
	cp ~/Pictures/sushi.jpg home/Pictures/
	cp ~/Pictures/Background.png home/Pictures/
	cp ~/Pictures/Background.xcf home/Pictures/

sync-down:
	rsync -aivP home/ ~/
