#!/bin/bash

printf "\n##### Installing Dotfiles #####\n\n"

cp dotfiles/bashrc ~/.bashrc
printf "Install .bashrc\n"

cp dotfiles/czrc ~/.czrc
printf "Install .czrc\n"

cp dotfiles/tmux.conf ~/.tmux.conf
printf "Install .tmux.conf\n"

cp dotfiles/config.fish ~/.config/fish/config.fish
printf "Install config.fish\n"

cp dotfiles/starship.toml ~/.config/starship.toml
printf "Install starship.toml\n"

if [ ! -d ~/.config/nvim ]
then
  mkdir -p ~/.config/nvim/lua/user
# else
#   rm -rf ~/.config/nvim.bak
#   mv ~/.config/nvim ~/.config/nvim.bak
#   printf "Backup neovim config\n"
#   mkdir -p ~/.config/nvim/lua/user
fi

cp dotfiles/init.lua ~/.config/nvim/init.lua
cp -r dotfiles/nvim/* ~/.config/nvim/lua/user/
printf "Install neovim config\n"

if [ ! -d ~/.config/alacritty ]
then
  mkdir -p ~/.config/alacritty
fi

cp dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
printf "Install alacritty.yml\n"
