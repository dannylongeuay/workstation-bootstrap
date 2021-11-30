#!/bin/bash

printf "\n##### Installing Docker #####\n\n"

if [ ! -x "$(command -v docker)" ];
then
  sudo sh -c "$(curl -fsSL https://get.docker.com)"
  getent group docker || sudo groupadd docker && sudo usermod -aG docker $USER
fi

sudo docker run --rm hello-world
