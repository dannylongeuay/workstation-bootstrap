#!/bin/bash

printf "\n##### Installing OS Packages #####\n\n"

# Setup apt sources
GITHUBCLI_ARCHIVE_KEYRING="/usr/share/keyrings/githubcli-archive-keyring.gpg"

if [ ! -f $GITHUBCLI_ARCHIVE_KEYRING ]
then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o $GITHUBCLI_ARCHIVE_KEYRING
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=$GITHUBCLI_ARCHIVE_KEYRING] https://cli.github.com/packages stable main" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
fi

DOCKER_ARCHIVE_KEYRING="/usr/share/keyrings/docker-archive-keyring.gpg"

if [ ! -f $DOCKER_ARCHIVE_KEYRING ]
then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o $DOCKER_ARCHIVE_KEYRING
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=$DOCKER_ARCHIVE_KEYRING] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

if ! sudo apt-add-repository -L | grep fish-shell
then
    sudo apt-add-repository -y ppa:fish-shell/release-3
fi

# Update and install packages
sudo apt update > /dev/null

sudo apt install -y curl git make vim tmux build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
coreutils ca-certificates gnupg lsb-release whois dnsutils gh dirmngr gpg gawk \
fish fzf fd-find bat httpie bashtop tree
