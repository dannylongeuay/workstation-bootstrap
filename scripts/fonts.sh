#!/bin/bash

printf "\n##### Installing Fonts #####\n\n"

FONTS_DIR="$HOME/.local/share/fonts"
DROIDSANS="$FONTS_DIR/DroidSansMono.zip" 
DEJAVUSANS="$FONTS_DIR/DejaVuSansMono.zip"

mkdir -p $FONTS_DIR

if [ ! -f "$DROIDSANS" ]
then
  curl -fLo "$DROIDSANS" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
  unzip $DROIDSANS -d $FONTS_DIR
fi

if [ ! -f "$DEJAVUSANS" ]
then
  curl -fLo "$DEJAVUSANS" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip
  unzip $DEJAVUSANS -d $FONTS_DIR
fi
