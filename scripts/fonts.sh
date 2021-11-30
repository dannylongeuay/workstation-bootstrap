#!/bin/bash

printf "\n##### Installing Fonts #####\n\n"

FONTS_DIR="$HOME/.local/share/fonts"
DROIDSANS="$FONTS_DIR/Droid Sans Mono for Powerline Nerd Font Complete.otf" 
FIRA_MONO="$FONTS_DIR/Fira Mono Regular Nerd Font Complete.otf"
SOURCE_CODE="$FONTS_DIR/Sauce Code Pro Nerd Font Complete Mono.ttf"

mkdir -p $FONTS_DIR

if [ ! -f "$DROIDSANS" ]
then
  curl -fLo "$DROIDSANS" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf 
fi

if [ ! -f "$FIRA_MONO" ]
then
  curl -fLo "$FIRA_MONO" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraMono/Regular/complete/Fira%20Mono%20Regular%20Nerd%20Font%20Complete.otf
fi

if [ ! -f "$SOURCE_CODE" ]
then
  curl -fLo "$SOURCE_CODE" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf
fi
