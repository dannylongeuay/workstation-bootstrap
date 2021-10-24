#!/bin/bash
set -e

printf "\n##### Installing OS Packages #####\n\n"

# Install packages
sudo apt update

sudo apt install -y curl git make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
zsh fonts-powerline ttf-ancient-fonts coreutils ca-certificates gnupg lsb-release \
whois dnsutils

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