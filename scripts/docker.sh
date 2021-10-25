#!/bin/bash

printf "\n##### Installing Docker #####\n\n"

sudo apt remove -y docker docker-engine docker.io containerd runc

sudo apt install -y docker-ce docker-ce-cli containerd.io

getent group docker || sudo groupadd docker && sudo usermod -aG docker $USER

sudo docker run --rm hello-world
