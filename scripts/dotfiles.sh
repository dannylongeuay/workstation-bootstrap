#!/bin/bash

printf "\n##### Installing Dotfiles #####\n\n"

cp dotfiles/bashrc ~/.bashrc
printf "Copied .bashrc\n"

cp dotfiles/czrc ~/.czrc
printf "Copied .czrc\n"

cp dotfiles/tmux.conf ~/.tmux.conf
printf "Copied .tmux.conf\n"

cp dotfiles/config.fish ~/.config/fish/config.fish
printf "Copied config.fish\n"

cp dotfiles/starship.toml ~/.config/starship.toml
printf "Copied starship.toml\n"

if [ ! -d ~/.config/nvim ]
then
  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/nvim/lua/user
fi

cp dotfiles/init.lua ~/.config/nvim/init.lua
cp -r dotfiles/nvim/* ~/.config/nvim/lua/user/
printf "Copied neovim config files\n"

if [ ! -d ~/.config/alacritty ]
then
  mkdir -p ~/.config/alacritty
fi

cp dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
printf "Copied alacritty.yml\n"
