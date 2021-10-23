#!/bin/bash
set -e

# Install packages
sudo apt update

sudo apt install -y curl git make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
zsh

# Install asdf
/bin/bash scripts/asdf.sh

# Configure ZSH
/bin/bash scripts/zsh.sh

# Copy dotfiles
/bin/bash scripts/dotfiles.sh

# Cleanup
sudo apt autoremove -y
