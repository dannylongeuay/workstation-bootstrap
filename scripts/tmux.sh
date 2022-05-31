#!/bin/bash
set -e

FORCE=$1

printf "\n##### Configuring TMUX #####\n\n"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]
then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
elif [ $FORCE == true ]
then
    cd $HOME/.tmux/plugins/tpm
    git pull
fi

$HOME/.tmux/plugins/tpm/bin/install_plugins
