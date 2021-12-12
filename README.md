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
- [Motivation](#motivation)

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

**Starship Clean Prompt:**

![Starship Clean Prompt Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/starship_clean.png)

**Starship Untracked Prompt:**

![Starship Untracked Prompt Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/starship_untracked.png)

**Starship Tracked Prompt:**

![Starship Tracked Prompt Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/starship_tracked.png)

**The following fish plugins are installed:**

- [jorgebucaran/fisher](https://github.com/jorgebucaran/fisher)
- [PatrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish)
- [evanlucas/fish-kubectl-completions](https://github.com/evanlucas/fish-kubectl-completions)

**Hotkeys:**

Find files - <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>F</kbd>

![Fish Find Example Usage](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/fish_find.png)

Search command history - <kbd>Ctrl</kbd>+<kbd>R</kbd>

![Fish History Example Usage](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/fish_history.png)

Accept entire autosuggestion - <kbd>Ctrl</kbd>+<kbd>F</kbd>

Accept first suggested word - <kbd>Alt</kbd>+<kbd>F</kbd>

**Abbreviations:**

- `k` = kubectl
- `ka` = kubectl get all -A
- `tl` = tree | less

## Packages

Noteworthy packages installed using aptitude:

- curl
- gawk
- [gh](https://cli.github.com/)
- git
- make
- tmux
- tree
- vim

**Github CLI:**

![Github CLI Example Usage](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/gh.png)

## Docker

This script will install [docker](https://docs.docker.com/engine/install/ubuntu/) and add the current user to the docker group. It also installs [docker-compose](https://docs.docker.com/compose/install/) v1 and [docker compose](https://docs.docker.com/compose/cli-command/) v2.

## ASDF

The following is a list of tools installed using [asdf-vm](https://asdf-vm.com/):

- [awscli](https://aws.amazon.com/cli/)
- [bat](https://github.com/sharkdp/bat)
- [delta](https://github.com/dandavison/delta)
- [doctl](https://github.com/digitalocean/doctl)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [go](https://go.dev/)
- [helm](https://helm.sh/)
- [httpie-go](https://github.com/nojima/httpie-go)
- [k3d](https://k3d.io)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [kubeseal](https://github.com/bitnami-labs/sealed-secrets)
- [node](https://nodejs.org/en/)
  - [commitizen](https://github.com/commitizen/cz-cli)
  - [cz-emoji](https://github.com/ngryman/cz-emoji)
- [poetry](https://python-poetry.org/)
- [pulumi](https://www.pulumi.com/)
- [python](https://www.python.org/)
  - [bpytop](https://github.com/aristocratos/bpytop)
  - [ansible](https://www.ansible.com/)
- [sops](https://github.com/mozilla/sops)
- [terraform](https://www.terraform.io/)
- [tilt](https://tilt.dev/)

**Delta Example:**

Syntax highlighting pager for `git`, `diff`, and `grep` output.

![Delta Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/delta.png)

**Commitizen Examples:**

Use `cz` instead of `git commit`.

![CZ Emoji Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/cz_emoji.png)

![CZ Commit Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/cz_commit.png)

**Bat Example:**

`cat` clone with syntax highlighting

![Bat Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/bat.png)

**Bpytop Example:**

Resource monitor

![Bpytop Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/bpytop.png)

**Httpie Example:**

User-friendly HTTP CLI.

![Httpie Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/ht.png)

## Dotfiles

The following dotfiles will be installed/updated:

- `.bashrc`
- `.czrc`
- `.tmux.conf`
- `config.fish`
- `starship.toml`

## Tmux

**Hotkeys (vim-like navigation):**

Prefix - <kbd>Ctrl</kbd>+<kbd>g</kbd>

Detach - <kbd>D</kbd>

Split right - <kbd>r</kbd>

Split down - <kbd>d</kbd>

Select left pane - <kbd>h</kbd>

Select down pane - <kbd>j</kbd>

Select up pane - <kbd>k</kbd>

Select right pane - <kbd>l</kbd>

**Tmux Multipane:**

Synchronize panes - <kbd>Ctrl</kbd>+<kbd>s</kbd>

![Tmux Multipane Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/tmux_multipane.png)

**Tmux plugins:**

- [tmux-power](https://github.com/wfxr/tmux-power)
- [tmux-net-speed](https://github.com/wfxr/tmux-net-speed)
- [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)

## Git

**Fish abbreviations:**

- `g` = git
- `gs` = git status
- `gc` = git checkout
- `gcb` = git checkout -b
- `gpl` = git pull
- `gpu` = git push
- `gd` = git diff HEAD
- `gl` = git log --oneline
- `ga` = git add -A

## Fonts

The following fonts are installed from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts):

- Droid Sans Mono
- DejaVu Sans Mono

> Use of patched fonts are necessary for starship and tmux to render icons correctly.

# Motivation

Create a reliable way to bootstrap a developer workstation. Level-up the development environment with a modern shell and toolset.

Support managing cloud resoures, AWS and DigitalOcean, with infrastructure as code, Terraform and Pulumi. Package, develop, and deploy apps with kubectl, kubeseal, helm, k3d, and tilt. Build services with python, golang, and javascript/typescript.
