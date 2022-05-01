#!/bin/bash

printf "\n##### Installing Helix Editor #####\n\n"

CARGO_ROOT_DIR=~/.cargo
REPO_DIR=~/dev/helix
CONFIG_DIR=~/.config/helix
RUNTIME_DIR=$REPO_DIR/runtime
RUNTIME_LINK_DIR=$CONFIG_DIR/runtime

if [ ! -d $CONFIG_DIR ]
then
  mkdir -p $CONFIG_DIR
fi

if [ ! -d $REPO_DIR ]
then
  git clone https://github.com/helix-editor/helix ~/dev/helix
fi

pushd $REPO_DIR
git pull > /dev/null

if [ ! -L $RUNTIME_LINK_DIR ]
then
  sudo ln -s $RUNTIME_DIR $RUNTIME_LINK_DIR
fi

cargo install --path helix-term --root $CARGO_ROOT_DIR
$CARGO_ROOT_DIR/bin/hx --grammar fetch > /dev/null || echo "Unable to fetch grammars"
$CARGO_ROOT_DIR/bin/hx --grammar build > /dev/null || echo "Unable to build grammers"

popd
cp dotfiles/helix.toml ~/.config/helix/config.toml

