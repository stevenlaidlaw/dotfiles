#!/usr/bin/env bash

cp ~/.config/nvim/init.vim init.vim
cp ~/.zshrc .zshrc
cp ~/.config/i3/config i3Config
cp ~/.oh-my-zsh/themes/custom.zsh-theme custom.zsh-theme
cp ~/.alacritty.yml .alacritty.yml

git add .
git commit -m "`date`"
git push
