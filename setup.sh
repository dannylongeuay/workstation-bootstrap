#!/bin/bash
set -e

# Install packages
/bin/bash scripts/packages.sh

# Install docker
/bin/bash scripts/docker.sh

# Configure ZSH
# /bin/bash scripts/zsh.sh

# Install fonts
/bin/bash scripts/fonts.sh

# Configure Starship Prompt
/bin/bash scripts/starship.sh

# Install asdf
/bin/bash scripts/asdf.sh

# Copy dotfiles
/bin/bash scripts/dotfiles.sh

# Configure TMUX
/bin/bash scripts/tmux.sh

printf "\n##### Set Default Shell #####\n\n"

sudo chsh -s $(which fish) $USER

printf "\n##### Performing Cleanup #####\n\n"

# Cleanup
sudo apt autoremove -y

printf "\n##### Bootstrapping Process Complete #####\n"
