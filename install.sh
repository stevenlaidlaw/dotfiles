#!/bin/bash
echo "Attempting dotfiles install..."

# Install zsh plugins
plugins=(
	"zsh-users zsh-syntax-highlighting"
	"zsh-users zsh-autosuggestions"
	"MichaelAquilina zsh-you-should-use"
)

for plugin in "${plugins[@]}"; do
	read -r owner repo <<< "$plugin"
	target_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$repo

	if [[ ! -d $target_dir ]]; then
		git clone https://github.com/$owner/$repo.git "$target_dir"
	fi
done

# Sync dotfiles
rsync -aivP home/ ~/

echo "Done installing dotfiles!"
