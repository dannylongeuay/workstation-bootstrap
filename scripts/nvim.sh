#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing Neovim #####\n\n"

# Install neovim nightly
if [ ! -f /usr/local/bin/nvim-nightly ] || [ $FORCE == true ]
then
  curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /tmp/nvim-nightly
  chmod u+x /tmp/nvim-nightly
  sudo mv /tmp/nvim-nightly /usr/local/bin
fi

# Install neovim stable
if [ ! -f /usr/local/bin/nvim-stable ] || [ $FORCE == true ]
then
  curl -L https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage -o /tmp/nvim-stable
  chmod u+x /tmp/nvim-stable
  sudo mv /tmp/nvim-stable /usr/local/bin
fi

if [ ! -L /usr/local/bin/nvim ]
then
  sudo ln -s /usr/local/bin/nvim-stable /usr/local/bin/nvim
fi

if [ ! -d ~/.config/nvim ]
then
  mkdir -p ~/.config/nvim
else
  rm -rf ~/.config/nvim.bak
  mv ~/.config/nvim ~/.config/nvim.bak
  printf "Created Neovim backup config\n"
  mkdir -p ~/.config/nvim
fi

cp -r nvim/* ~/.config/nvim

if [ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]
then
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
fi

