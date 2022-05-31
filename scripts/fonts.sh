#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing Fonts #####\n\n"

FONTS_DIR="$HOME/.local/share/fonts"

mkdir -p $FONTS_DIR

declare -A arr1=(
    [zip_path]="$FONTS_DIR/DroidSansMono.zip" 
    [font_url]="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip"
)

declare -A arr2=(
    [zip_path]="$FONTS_DIR/DejaVuSansMono.zip"
    [font_url]="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip"
)

fonts=("${!arr@}")

declare -n ref

for ref in "${fonts[@]}"
do
  if [ ! -f "${ref[zip_path]}" ] || [ $FORCE == true ]
  then
    printf "Installing %s...\n" "${ref[zip_path]}"
    curl -fLo "${ref[zip_path]}" "${ref[font_url]}"
    unzip -o "${ref[zip_path]}" -d $FONTS_DIR
  else
    printf "%s already installed...\n" "${ref[zip_path]}"
  fi
done

