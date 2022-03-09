#!/bin/bash

printf "\n##### Installing Nvim #####\n\n"

# Install neovim nightly
if [ ! -f /usr/local/bin/nvim-nightly ]
then
  curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /tmp/nvim-nightly
  chmod u+x /tmp/nvim-nightly
  sudo mv /tmp/nvim-nightly /usr/local/bin
fi

# Install neovim stable
if [ ! -f /usr/local/bin/nvim-stable ]
then
  curl -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -o /tmp/nvim-stable
  chmod u+x /tmp/nvim-stable
  sudo mv /tmp/nvim-stable /usr/local/bin
fi

if [ ! -L /usr/local/bin/nvim ]
then
  sudo ln -s /usr/local/bin/nvim-nightly /usr/local/bin/nvim
else
  printf "Neovim is already installed\n"
fi
