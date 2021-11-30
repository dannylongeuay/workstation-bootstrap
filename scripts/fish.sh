#!/bin/bash

printf "\n##### Configuring Fish #####\n\n"

sudo chsh -s $(which fish) $USER

mkdir -p ~/.config/fish/completions 
ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
