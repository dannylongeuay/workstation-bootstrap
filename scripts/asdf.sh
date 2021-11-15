#!/bin/bash

printf "\n##### Installing ASDF #####\n\n"

# Install ASDF
if [ ! -d "$HOME/.asdf" ]
then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 > /dev/null || true
else
    asdf update
fi

. $HOME/.asdf/asdf.sh

printf "\n##### Installing Python #####\n\n"
asdf plugin-add python > /dev/null || true
asdf install python 3.9.4
asdf global python 3.9.4

printf "\n##### Installing Ansible #####\n\n"
asdf plugin add ansible-base https://github.com/amrox/asdf-pyapp.git > /dev/null || true
asdf install ansible-base 2.10.15
asdf global ansible-base 2.10.15

printf "\n##### Installing Digital Ocean CLI #####\n\n"
asdf plugin-add doctl https://github.com/maristgeek/asdf-doctl.git > /dev/null || true
asdf install doctl 1.65.0
asdf global doctl 1.65.0

printf "\n##### Installing Golang #####\n\n"
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git > /dev/null || true
asdf install golang 1.17.2
asdf global golang 1.17.2

printf "\n##### Installing Helm #####\n\n"
asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git > /dev/null || true
asdf install helm 3.7.1
asdf global helm 3.7.1

printf "\n##### Installing k3d #####\n\n"
asdf plugin-add k3d https://github.com/spencergilbert/asdf-k3d.git > /dev/null || true
asdf install k3d 5.0.1
asdf global k3d 5.0.1

printf "\n##### Installing Kubernetes CLI #####\n\n"
asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git > /dev/null || true
asdf install kubectl 1.22.2
asdf global kubectl 1.22.2

printf "\n##### Installing Poerty #####\n\n"
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git > /dev/null || true
asdf install poetry 1.1.11
asdf global poetry 1.1.11

printf "\n##### Installing Pulumi #####\n\n"
asdf plugin-add pulumi https://github.com/canha/asdf-pulumi.git > /dev/null || true
asdf install pulumi 3.16.0
asdf global pulumi 3.16.0

printf "\n##### Installing SOPS #####\n\n"
asdf plugin-add sops https://github.com/feniix/asdf-sops.git > /dev/null || true
asdf install sops 3.7.1
asdf global sops 3.7.1

printf "\n##### Installing Tilt #####\n\n"
asdf plugin add tilt > /dev/null || true
asdf install tilt 0.22.14
asdf global tilt 0.22.14

printf "\n##### Installing Nodejs #####\n\n"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git > /dev/null || true
asdf install nodejs 16.13.0
asdf global nodejs 16.13.0
