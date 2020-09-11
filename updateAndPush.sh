#!/usr/bin/env bash

cp ~/.config/nvim/init.vim init.vim
cp ~/.zshrc .zshrc
cp ~/.config/i3/config i3Config

git add .
git commit -m "`date`"
git push

