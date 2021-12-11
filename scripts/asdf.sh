#!/bin/bash

printf "\n##### Installing ASDF #####\n\n"

# Install ASDF
if [ ! -d "$HOME/.asdf" ]
then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 > /dev/null || true
else
    . $HOME/.asdf/asdf.sh
    asdf update
fi

. $HOME/.asdf/asdf.sh

if ! which python > /dev/null
then
    printf "\n##### Installing Python #####\n\n"
    asdf plugin-add python > /dev/null || true
    asdf install python 3.9.4
    asdf global python 3.9.4
fi

if ! which ansible > /dev/null
then
    printf "\n##### Installing Ansible #####\n\n"
    asdf plugin add ansible-base https://github.com/amrox/asdf-pyapp.git > /dev/null || true
    asdf install ansible-base 2.10.15
    asdf global ansible-base 2.10.15
fi

if ! which aws > /dev/null
then
    printf "\n##### Installing AWS CLI #####\n\n"
    asdf plugin add awscli > /dev/null || true
    asdf install awscli 2.4.5
    asdf global awscli 2.4.5
fi

if ! which doctl > /dev/null
then
    printf "\n##### Installing Digital Ocean CLI #####\n\n"
    asdf plugin-add doctl https://github.com/maristgeek/asdf-doctl.git > /dev/null || true
    asdf install doctl 1.65.0
    asdf global doctl 1.65.0
fi

if ! which go > /dev/null
then
    printf "\n##### Installing Golang #####\n\n"
    asdf plugin-add golang https://github.com/kennyp/asdf-golang.git > /dev/null || true
    asdf install golang 1.17.2
    asdf global golang 1.17.2
fi

if ! which terraform > /dev/null
then
    printf "\n##### Installing Terraform #####\n\n"
    asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git > /dev/null || true
    asdf install terraform 1.0.11
    asdf global terraform 1.0.11
fi

if ! which helm > /dev/null
then
    printf "\n##### Installing Helm #####\n\n"
    asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git > /dev/null || true
    asdf install helm 3.7.1
    asdf global helm 3.7.1
fi

if ! helm plugin list | grep diff > /dev/null
then
    helm plugin install https://github.com/databus23/helm-diff
fi

if ! which k3d > /dev/null
then
    printf "\n##### Installing k3d #####\n\n"
    asdf plugin-add k3d https://github.com/spencergilbert/asdf-k3d.git > /dev/null || true
    asdf install k3d 5.0.1
    asdf global k3d 5.0.1
fi

if ! which kubectl > /dev/null
then
    printf "\n##### Installing Kubernetes CLI #####\n\n"
    asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git > /dev/null || true
    asdf install kubectl 1.22.2
    asdf global kubectl 1.22.2
fi

if ! which kubeseal > /dev/null
then
    printf "\n##### Installing Kubeseal #####\n\n"
    asdf plugin-add kubeseal > /dev/null || true
    asdf install kubeseal 0.16.0
    asdf global kubeseal 0.16.0
fi

if ! which poetry > /dev/null
then
    printf "\n##### Installing Poerty #####\n\n"
    asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git > /dev/null || true
    asdf install poetry 1.1.11
    asdf global poetry 1.1.11
fi

if ! which pulumi > /dev/null
then
    printf "\n##### Installing Pulumi #####\n\n"
    asdf plugin-add pulumi https://github.com/canha/asdf-pulumi.git > /dev/null || true
    asdf install pulumi 3.16.0
    asdf global pulumi 3.16.0
fi

if ! which sops > /dev/null
then
    printf "\n##### Installing SOPS #####\n\n"
    asdf plugin-add sops https://github.com/feniix/asdf-sops.git > /dev/null || true
    asdf install sops 3.7.1
    asdf global sops 3.7.1
fi

if ! which tilt > /dev/null
then
    printf "\n##### Installing Tilt #####\n\n"
    asdf plugin add tilt > /dev/null || true
    asdf install tilt 0.22.14
    asdf global tilt 0.22.14
fi

if ! which node > /dev/null
then
    printf "\n##### Installing Nodejs #####\n\n"
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git > /dev/null || true
    asdf install nodejs 16.13.0
    asdf global nodejs 16.13.0
fi

if ! which cz > /dev/null
then
    npm install -g commitizen
    npm install -g cz-emoji
fi

if ! which delta > /dev/null
then
    printf "\n##### Installing Delta #####\n\n"
    asdf plugin add delta https://github.com/andweeb/asdf-delta.git > /dev/null || true
    asdf install delta 0.11.0
    asdf global delta 0.11.0
fi
