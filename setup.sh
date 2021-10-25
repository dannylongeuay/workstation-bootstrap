#!/bin/bash
set -e

# Install packages
/bin/bash scripts/packages.sh

# Install docker
/bin/bash scripts/docker.sh

# Configure ZSH
/bin/bash scripts/zsh.sh

# Install asdf
/bin/bash scripts/asdf.sh

# Copy dotfiles
/bin/bash scripts/dotfiles.sh

printf "\n##### Performing Cleanup #####\n\n"

# Cleanup
sudo apt autoremove -y

printf "\n##### Bootstrapping Process Complete #####\n"