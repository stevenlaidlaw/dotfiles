#!/usr/bin/env bash

cp ~/.vimrc .vimrc
cp ~/.zshrc .zshrc
cp ~/.config/i3/config i3Config
cp ~/.config/polybar/config polybarConfig
cp ~/.config/kitty/kitty.conf kittyConfig

mkdir -p scripts/polybar/
cp ~/.config/polybar/scripts/* scripts/polybar/

git add .
git commit -m "`date`"
git push

