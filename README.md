# Workstation Bootstrap

This repo contains scripts that I used to bootstrap/update my personal and profressional developer workstations.

## Table of Contents

- [Disclaimer](#disclaimer)
- [Usage](#usage)
- [Features](#features)
  - [Shell](#shell)
  - [Packages](#packages)
  - [Docker](#docker)
  - [ASDF](#asdf)
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

## Shell

[fish](https://fishshell.com/) is set as the default shell and [starship](https://starship.rs/) is used for the prompt.

The following fish plugins are installed:

- [jorgebucaran/fisher](https://github.com/jorgebucaran/fisher)
- [PatrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish)
- [evanlucas/fish-kubectl-completions](https://github.com/evanlucas/fish-kubectl-completions)

Hotkeys:

Find files - <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>F</kbd>

![Fish Find Example Usage](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/fish_find.png)

Search command history - <kbd>Ctrl</kbd>+<kbd>R</kbd>

![Fish History Example Usage](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/fish_history.png)

Accept entire autosuggestion - <kbd>Ctrl</kbd>+<kbd>F</kbd>

Accept first suggested word - <kbd>Alt</kbd>+<kbd>F</kbd>

## Packages

Noteworthy packages installed using aptitude:

- curl
- gawk
- [gh](https://cli.github.com/)
  - Github CLI
  - ![Github CLI Example Usage](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/gh.png)
- git
- make
- tmux
- tree
- vim

## Docker

This script will install docker and add the current user to the docker group. It also installs docker-compose v1 and docker compose v2.

## ASDF

The following is a list of tools installed using [asdf-vm](https://asdf-vm.com/):

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
