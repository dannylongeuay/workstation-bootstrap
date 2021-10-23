#!/bin/bash

# Install ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 > /dev/null || true

. $HOME/.asdf/asdf.sh

# Install Python
asdf plugin-add python > /dev/null || true
asdf install python 3.9.4
asdf global python 3.9.4

# Install Ansible
asdf plugin add ansible-base https://github.com/amrox/asdf-pyapp.git > /dev/null || true
asdf install ansible-base 2.10.15
asdf global ansible-base 2.10.15


# Install Digital Ocean CLI
asdf plugin-add doctl https://github.com/maristgeek/asdf-doctl.git > /dev/null || true
asdf install doctl 1.65.0
asdf global doctl 1.65.0

# Install Golang
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git > /dev/null || true
asdf install golang 1.17.2
asdf global golang 1.17.2

# Install Helm
asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git > /dev/null || true
asdf install helm 3.7.1
asdf global helm 3.7.1

# Install k3d
asdf plugin-add k3d https://github.com/spencergilbert/asdf-k3d.git > /dev/null || true
asdf install k3d 5.0.1
asdf global k3d 5.0.1

# Install kubectl
asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git > /dev/null || true
asdf install kubectl 1.22.2
asdf global kubectl 1.22.2

# Install poetry
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git > /dev/null || true
asdf install poetry 1.1.11
asdf global poetry 1.1.11

# Install pulumi
asdf plugin-add pulumi https://github.com/canha/asdf-pulumi.git > /dev/null || true
asdf install pulumi 3.16.0
asdf global pulumi 3.16.0

# Install sops
asdf plugin-add sops https://github.com/feniix/asdf-sops.git > /dev/null || true
asdf install sops 3.7.1
asdf global sops 3.7.1

# Install titl
asdf plugin add tilt > /dev/null || true
asdf install tilt 0.22.14
asdf global tilt 0.22.14
