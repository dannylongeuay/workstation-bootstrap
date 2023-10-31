#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing Helix Editor #####\n\n"

CONFIG_DIR=~/.config/helix
BACKUP_DIR=~/.config/helix.bak

if [ ! -f /usr/local/bin/hx-stable ] || [ $FORCE == true ]
then
  curl -L https://github.com/helix-editor/helix/releases/download/23.10/helix-23.10-x86_64.AppImage -o /tmp/hx-stable
  chmod u+x /tmp/hx-stable
  sudo mv /tmp/hx-stable /usr/local/bin
fi

if [ ! -L /usr/local/bin/hx ]
then
  sudo ln -s /usr/local/bin/hx-stable /usr/local/bin/hx
fi

if [ ! -d $CONFIG_DIR ]
then
  mkdir -p $CONFIG_DIR
else
  rm -rf $BACKUP_DIR
  mv $CONFIG_DIR $BACKUP_DIR
  printf "Created Helix Editor backup config\n"
  mkdir -p $CONFIG_DIR
fi

cp dotfiles/helix-config.toml $CONFIG_DIR/config.toml
cp dotfiles/helix-languages.toml $CONFIG_DIR/languages.toml
