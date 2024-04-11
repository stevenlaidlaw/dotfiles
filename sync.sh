# Get local files and put them in this repo

files_array=(
  .oh-my-zsh/themes/custom.zsh-theme
  .zshrc
  .vimrc
  .config/kitty/
  .fonts/
)

for file in ${files_array[@]}; do
  rsync -aivP --mkpath ~/$file home/$file
done
