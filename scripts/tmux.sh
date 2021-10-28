#!/bin/bash

printf "\n##### Configuring TMUX #####\n\n"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]
then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

$HOME/.tmux/plugins/tpm/bin/install_plugins
