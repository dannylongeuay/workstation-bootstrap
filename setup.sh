#!/bin/bash
set -e

printf "\n##### Bootstrapping Process Started #####\n"

# Install packages
/bin/bash scripts/packages.sh

# Install docker
/bin/bash scripts/docker.sh

# Install fonts
/bin/bash scripts/fonts.sh

# Configure Starship Prompt
/bin/bash scripts/starship.sh

# Install asdf
/bin/bash scripts/asdf.sh

# Install Neovim
/bin/bash scripts/nvim.sh

# Install Helix Editor
/bin/bash scripts/helix.sh

# Copy dotfiles
/bin/bash scripts/dotfiles.sh

# Configure TMUX
/bin/bash scripts/tmux.sh

# Configure FISH
/usr/bin/fish scripts/fish.sh

# Configure GIT
/bin/bash scripts/gitconfig.sh

printf "\n##### Performing Cleanup #####\n\n"

# Cleanup
sudo apt autoremove -y

printf "\n##### Bootstrapping Process Complete #####\n"
