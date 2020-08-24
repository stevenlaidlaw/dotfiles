#!/usr/bin/env bash

cp ~/.vimrc .vimrc
cp ~/.zshrc .zshrc
cp ~/.config/i3/config i3Config

git add .
git commit -m "`date`"
git push

