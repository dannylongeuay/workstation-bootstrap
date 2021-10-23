#!/bin/bash

printf "\n##### Installing Docker #####\n\n"

sudo apt remove -y docker docker-engine docker.io containerd runc

DOCKER_ARCHIVE_KEYRING="/usr/share/keyrings/docker-archive-keyring.gpg"

if [ ! -f $DOCKER_ARCHIVE_KEYRING ]
then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o $DOCKER_ARCHIVE_KEYRING
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=$DOCKER_ARCHIVE_KEYRING] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

getent group docker || sudo groupadd docker && sudo usermod -aG docker $USER

sudo docker run --rm hello-world
