#!/bin/bash

printf "\n##### Installing Dotfiles #####\n\n"

cp dotfiles/bashrc ~/.bashrc
printf "Installed .bashrc\n"

cp dotfiles/czrc ~/.czrc
printf "Installed .czrc\n"

cp dotfiles/tmux.conf ~/.tmux.conf
printf "Installed .tmux.conf\n"

cp dotfiles/config.fish ~/.config/fish/config.fish
printf "Installed config.fish\n"

cp dotfiles/starship.toml ~/.config/starship.toml
printf "Installed starship.toml\n"

if [ ! -d ~/.config/alacritty ]
then
  mkdir -p ~/.config/alacritty
fi

cp dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
printf "Installed alacritty.yml\n"
