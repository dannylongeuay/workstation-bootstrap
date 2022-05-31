#!/bin/bash
set -e

FORCE=false

while getopts f flag
do
  case "${flag}" in
    f) FORCE=true ;;
    *) echo 'Invalid flag passed to script' >&2
      exit 1
  esac
done

printf "\n##### Bootstrapping Process Started #####\n"

# Install packages
/bin/bash scripts/packages.sh $FORCE

# Install docker
/bin/bash scripts/docker.sh $FORCE

# Install fonts
/bin/bash scripts/fonts.sh $FORCE

# Configure Starship Prompt
/bin/bash scripts/starship.sh

# Install asdf
/bin/bash scripts/asdf.sh $FORCE

# Install Language Servers
/bin/bash scripts/language_servers.sh $FORCE

# Install Go Tools
/bin/bash scripts/golang.sh $FORCE

# Install Crates
/bin/bash scripts/rust.sh $FORCE

# Install Node Packages
/bin/bash scripts/node.sh $FORCE

# Install Helm Plugins
/bin/bash scripts/helm.sh $FORCE

# Install Neovim
/bin/bash scripts/nvim.sh $FORCE

# Install Helix Editor
/bin/bash scripts/helix.sh

# Copy dotfiles
/bin/bash scripts/dotfiles.sh

# Configure TMUX
/bin/bash scripts/tmux.sh $FORCE

# Configure FISH
/usr/bin/fish scripts/fish.sh $FORCE

# Configure GIT
/bin/bash scripts/gitconfig.sh

printf "\n##### Performing Cleanup #####\n\n"

# Cleanup
sudo apt autoremove -y

printf "\n##### Bootstrapping Process Complete #####\n"
