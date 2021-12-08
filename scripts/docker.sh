#!/bin/bash

printf "\n##### Installing Docker #####\n\n"

if [ ! -x "$(command -v docker)" ];
then
  # Install docker
  sudo sh -c "$(curl -fsSL https://get.docker.com)"
  getent group docker || sudo groupadd docker && sudo usermod -aG docker $USER

  # Install docker compose (note: this is v2 and not docker-compose v1)
  mkdir -p ~/.docker/cli-plugins/
  curl -SL https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
  chmod +x ~/.docker/cli-plugins/docker-compose
fi

if [ ! -x "$(command -v docker-compose)" ];
then
  # Install docker-compose v1
  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

sudo docker run --rm hello-world
