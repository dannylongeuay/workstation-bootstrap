# Workstation Bootstrap

This repo contains scripts that I used to bootstrap/update my personal and profressional developer workstations.

## Table of Contents

- [Disclaimer](#disclaimer)
- [Usage](#usage)
- [Features](#features)
  - [Packages](#packages)
  - [Docker](#docker)
  - [ASDF](#asdf)
  - [Shell](#shell)
  - [Dotfiles](#dotfiles)
  - [Tmux](#tmux)
  - [Git](#git)
  - [Fonts](#fonts)

## Disclaimer

This repo has only be tested and used on `Pop!_OS 21.04`. Use at your own risk on other distributions/platforms!

## Usage

Clone this repo and run the following top-level script:

```
./setup.sh
```

Then log out and log back in for the changes to take full affect.

> Log out/log in is necessary for shell and docker group changes. This is only necessary after the first run of this script.

# Features

Outlined below are various features this bootstrapping process offers. This is not an exhaustive list, but rather a highlight reel.

## Packages

- curl
- gawk
- gh
- git
- make
- tmux
- tree
- vim

## Docker

docker

docker-compose

## ASDF

- awscli
- bat
- delta
- doctl
- fd
- fzf
- go
- helm
- httpie-go
- k3d
- kubectl
- kubeseal
- node
  - commitizen
  - cz-emoji
- poetry
- pulumi
- python
  - [bpytop](https://github.com/aristocratos/bpytop)
  - ansible
- sops
- terraform
- tilt

## Shell

starship

fish

## Dotfiles

- .bashrc
- .czrc
- .tmux.conf
- config.fish
- starship.toml

## Tmux

vim-like navigation

## Git

git configuration

## Fonts

nerdfonts
