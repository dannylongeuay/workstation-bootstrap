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