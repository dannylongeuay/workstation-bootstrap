#!/bin/bash

printf "\n##### Installing Dotfiles #####\n\n"

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

cp dotfiles/kitty.conf ~/.config/kitty/kitty.conf
printf "Installed kitty.conf\n"

if [ ! -d ~/.config/zellij ]
then
  mkdir -p ~/.config/zellij
fi

cp dotfiles/zellij.kdl ~/.config/zellij/config.kdl
printf "Installed config.kdl for Zellij\n"


if [ ! -d ~/.config/wezterm ]
then
  mkdir -p ~/.config/wezterm
fi

cp dotfiles/wezterm.lua ~/.config/wezterm/wezterm.lua
printf "Installed wezterm.lua for wezterm\n"
