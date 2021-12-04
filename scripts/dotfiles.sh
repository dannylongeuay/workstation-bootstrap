#!/bin/bash

printf "\n##### Installing Dotfiles #####\n"

cp dotfiles/bashrc ~/.bashrc
cp dotfiles/czrc ~/.czrc
cp dotfiles/tmux.conf ~/.tmux.conf
cp dotfiles/config.fish ~/.config/fish/config.fish
