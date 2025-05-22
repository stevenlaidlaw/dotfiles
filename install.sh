#!/bin/bash
echo "Attempting dotfiles install..."

#Sync dotfiles
rsync -aivP home/ ~/

echo "Done installing dotfiles!"
