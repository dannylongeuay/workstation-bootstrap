#!/bin/bash

printf "\n##### Installing Dotfiles #####\n"

cp dotfiles/bashrc ~/.bashrc
printf "Copied .bashrc\n"
cp dotfiles/czrc ~/.czrc
printf "Copied .czrc\n"
cp dotfiles/tmux.conf ~/.tmux.conf
printf "Copied .tmux.conf\n"
cp dotfiles/config.fish ~/.config/fish/config.fish
printf "Copied config.fish\n"
