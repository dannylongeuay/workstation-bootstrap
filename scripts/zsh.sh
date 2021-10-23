#!/bin/bash

printf "\n##### Installing OH MY ZSH #####\n\n"

if [ ! -d "$HOME/.oh-my-zsh/" ]
then
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash || true
else
    $HOME/.oh-my-zsh/tools/upgrade.sh
fi

ZSH_CUSTOM_THEMES="$HOME/.oh-my-zsh/custom/themes"
ZSH_SPACESHIP_THEME="$ZSH_CUSTOM_THEMES/spaceship.zsh-theme"
SPACESHIP_PROMPT="$ZSH_CUSTOM_THEMES/spaceship-prompt"
SPACESHIP_THEME="$SPACESHIP_PROMPT/spaceship.zsh-theme"

if [ ! -d $SPACESHIP_PROMPT ]
then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git $SPACESHIP_PROMPT --depth=1
fi

if [ ! -f $ZSH_SPACESHIP_THEME ]
then
    ln -s $SPACESHIP_THEME $ZSH_SPACESHIP_THEME
fi
