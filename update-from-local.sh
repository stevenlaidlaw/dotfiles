# Get local files and put them in this repo

files_array=(
  .oh-my-zsh/themes/custom.zsh-theme
  .zshrc
  .vimrc
  .fonts/
  workspace/update-all.sh
)

for file in ${files_array[@]}; do
  rsync -aivP --mkpath ~/$file home/$file
done
