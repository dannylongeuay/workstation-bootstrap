# Workstation Bootstrap

This repo contains scripts that I used to bootstrap/update my personal
and professional developer workstations.

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
  - [Neovim](#neovim)
- [Motivation](#motivation)

## Disclaimer

This repo has only been tested and used on `Pop!_OS 21.04`. Use at your own risk
on other distributions/platforms!

## Usage

Clone this repo and run the following top-level script:

```
./setup.sh
```

Then log out and log back in for the changes to take full affect.

> Log out/log in is necessary for shell and docker group changes. This is only
> necessary after the first run of this script.

## Features

Outlined below are various features this bootstrapping process offers. This is
not an exhaustive list, but rather a highlight reel.

## Shell

The default shell is [fish](https://fishshell.com/) and [starship](https://starship.rs/)
is used for the prompt.

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
- `nv` = nvim
- `tl` = tree | less
- `xc` = xclip -selection clipboard

## Packages

Noteworthy packages installed using aptitude:

- curl
- gawk
- [gh](https://cli.github.com/)
- git
- make
- neovim
- ripgrep
- tmux
- tree
- vim
- xclip

**Github CLI:**

![Github CLI Example Usage](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/gh.png)

## Docker

This script will install [docker](https://docs.docker.com/engine/install/ubuntu/)
and add the current user to the docker group.
It also installs [docker-compose](https://docs.docker.com/compose/install/) v1 and
[docker compose](https://docs.docker.com/compose/cli-command/) v2.

## ASDF

The following is a list of tools installed using [asdf-vm](https://asdf-vm.com/):

- [awscli](https://aws.amazon.com/cli/)
- [bat](https://github.com/sharkdp/bat)
- [delta](https://github.com/dandavison/delta)
- [doctl](https://github.com/digitalocean/doctl)
- [duf](https://github.com/muesli/duf)
- [exa](https://the.exa.website)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [go](https://go.dev/)
- [helm](https://helm.sh/)
- [httpie-go](https://github.com/nojima/httpie-go)
- [k3d](https://k3d.io)
- [k9s](https://github.com/derailed/k9s)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [kubeseal](https://github.com/bitnami-labs/sealed-secrets)
- [node](https://nodejs.org/en/)
  - [commitizen](https://github.com/commitizen/cz-cli)
  - [cz-emoji](https://github.com/ngryman/cz-emoji)
  - [fx](https://github.com/antonmedv/fx)
- [poetry](https://python-poetry.org/)
- [pulumi](https://www.pulumi.com/)
- [python](https://www.python.org/)
  - [bpytop](https://github.com/aristocratos/bpytop)
  - [ansible](https://www.ansible.com/)
- [sops](https://github.com/mozilla/sops)
- [terraform](https://www.terraform.io/)
- [tilt](https://tilt.dev/)

**Bat Example:**

`cat` clone with syntax highlighting

![Bat Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/bat.png)

**Bpytop Example:**

Resource monitor

![Bpytop Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/bpytop.png)

**Commitizen Examples:**

Conventional commits with git emojis. Use `cz` instead of `git commit`.

![CZ Emoji Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/cz_emoji.png)

![CZ Commit Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/cz_commit.png)

**Delta Example:**

Syntax highlighting pager for `git`, `diff`, and `grep` output.

![Delta Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/delta.png)

**Duf Example:**

Disk usage utility.

![Duf Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/duf.png)

**Exa Example:**

Modern replacement for `ls`.

![Exa Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/exa.png)

**Fx Example:**

JSON processing tool.

![Fx Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/fx.png)

**Httpie Example:**

User-friendly HTTP CLI.

![Httpie Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/ht.png)

**K9S Example:**

Terminal UI to interact with kubernetes cluster.

![K9S Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/k9s.png)

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

Select prev window - <kbd>Ctrl</kbd>-<kbd>h</kbd>

Select next window - <kbd>Ctrl</kbd>+<kbd>l</kbd>

Select window - <kbd>0-9</kbd>

Window interactive index - <kbd>w</kbd>

**Tmux Multipane:**

Synchronize panes - <kbd>Ctrl</kbd>+<kbd>s</kbd>

![Tmux Multipane Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/tmux_multipane.png)

**Tmux plugins:**

- [tmux-power](https://github.com/wfxr/tmux-power)
- [tmux-net-speed](https://github.com/wfxr/tmux-net-speed)
- [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)

**Tmux abbreviations:**

- `tmd` = tmux new -s dev
- `tma` = tmux a

## Git

**Fish abbreviations:**

- `g` = git
- `ga` = git add -A
- `gb` = git branch
- `gbd` = git branch -d
- `gbD` = git branch -D
- `gc` = git checkout
- `gcb` = git checkout -b
- `gd` = git diff HEAD
- `gl` = git log --oneline
- `gpl` = git pull
- `gm` = git merge
- `gmc` = git merge --continue
- `gpu` = git push
- `gs` = git status

## Fonts

The following fonts are installed from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts):

- Droid Sans Mono
- DejaVu Sans Mono

> Use of patched fonts are necessary for starship and tmux to render icons correctly.

## Neovim

Heavily modded [Neovim](https://neovim.io/) installation.

![Alpha Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/alpha.png)

### Custom keybindings

| Category      |             Binding              | Function                         |      Mode      |
| ------------- | :------------------------------: | -------------------------------- | :------------: |
| General       |         <kbd>Space</kbd>         | Leader                           |     Normal     |
| Window Nav    |   <kbd>Ctrl</kbd>+<kbd>h</kbd>   | Move cursor to left window       |     Normal     |
|               |   <kbd>Ctrl</kbd>+<kbd>j</kbd>   | Move cursor to down window       |     Normal     |
|               |   <kbd>Ctrl</kbd>+<kbd>k</kbd>   | Move cursor to up window         |     Normal     |
|               |   <kbd>Ctrl</kbd>+<kbd>l</kbd>   | Move cursor to right window      |     Normal     |
| Window Resize | <kbd>Ctrl</kbd>+<kbd>Left</kbd>  | Resize window left               |     Normal     |
|               | <kbd>Ctrl</kbd>+<kbd>Down</kbd>  | Resize window down               |     Normal     |
|               |  <kbd>Ctrl</kbd>+<kbd>Up</kbd>   | Resize window up                 |     Normal     |
|               | <kbd>Ctrl</kbd>+<kbd>Right</kbd> | Resize window right              |     Normal     |
| Buffer Nav    |  <kbd>Shift</kbd>+<kbd>h</kbd>   | Go to previous buffer            |     Normal     |
|               |  <kbd>Shift</kbd>+<kbd>l</kbd>   | Go to next buffer                |     Normal     |
| Comments      |     <kbd>g</kbd><kbd>c</kbd>     | Toggle line comment              | Normal, Visual |
|               |     <kbd>g</kbd><kbd>b</kbd>     | Toggle block comment             | Normal, Visual |
| Diagnostics   |           <kbd>K</kbd>           | Toggle hover                     |     Normal     |
|               |     <kbd>g</kbd><kbd>d</kbd>     | Go to definition                 |     Normal     |
|               |     <kbd>g</kbd><kbd>l</kbd>     | Toggle line diagnostic float     |     Normal     |
|               |     <kbd>[</kbd><kbd>d</kbd>     | Go to previous diagnostic        |     Normal     |
|               |     <kbd>]</kbd><kbd>d</kbd>     | Go to next diagnostic            |     Normal     |
| Git           |     <kbd>[</kbd><kbd>g</kbd>     | Go to previous hunk              |     Normal     |
|               |     <kbd>]</kbd><kbd>g</kbd>     | Go to next hunk                  |     Normal     |
| Quickfix      |     <kbd>[</kbd><kbd>q</kbd>     | Go to previous quickfix location |     Normal     |
|               |     <kbd>]</kbd><kbd>q</kbd>     | Go to next quickfix location     |     Normal     |
| Terminal      |   <kbd>Ctrl</kbd>+<kbd>\</kbd>   | Toggle terminal                  |     Normal     |

### Plugins

#### General

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) -- packerception
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) -- lua function library

#### QoL

- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) -- autopairs, integrates with cmp and treesitter
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) -- smarter comments
- [famiu/bufdelete.nvim](https://github.com/famiu/bufdelete.nvim) -- sane bdelete and bwipeout commands
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) -- customizable statusline
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) -- toggle and persist terminals

![Toggleterm Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/toggleterm.png)

- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) -- indentation line guides
- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) -- customizable greeter
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim) -- keybindings popup

![Which Key Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/whichkey.png)

- [davidgranstrom/nvim-markdown-preview](https://github.com/davidgranstrom/nvim-markdown-preview) -- async markdown previewer
- [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) -- smooth scrolling
- [ggandor/lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim) -- motion plugin

![Lightspeed Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/lightspeed.png)

- [Shatur/neovim-session-manager](https://github.com/Shatur/neovim-session-manager) -- automatic session management
- [stevearc/qf_helper.nvim](https://github.com/stevearc/qf_helper.nvim) -- quickfix improvements

#### Themes

- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) -- clean, dark theme
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) -- devicons

#### Completion

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) -- completion plugin

![Completion Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/completion.png)

- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) -- buffer completions
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) -- path completions
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) -- command line completions
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) -- snippet completions
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) -- LSP completions

#### Snippets

- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) -- snippet engine
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) -- a collection of useful snippets

![Snippets Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/snippets.png)

#### LSP

- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) -- enable LSP

![LSP Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/lsp.png)

- [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) -- language server installer

![LSP Installer Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/lsp_installer.png)

- [tamago324/nlsp-settings.nvim](https://github.com/tamago324/nlsp-settings.nvim) -- LSP server configurations
- [b0o/schemastore.nvim](https://github.com/b0o/schemastore.nvim) -- JSON schemastore catalog access

![JSON Schema Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/json_schema.png)

#### Navigation

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) -- file/text fuzzy finder

![Telescope file Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/telescope_file.png)

![Telescope grep Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/telescope_grep.png)

- [nvim-telescope/telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim) -- use telescope picker for neovim selections
- [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) -- file explorer

![NvimTree Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/nvim_tree.png)

- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) -- customizable buffer line

#### Syntax

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) -- syntax highlighting

![Syntax Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/syntax.png)

#### Git

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) -- git gutter diagnostics

#### Code Quality

- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) -- linting and formatting integration with LSP

![Code Quality Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/code_quality.png)

#### Performance

- [lewis6991/impatient.nvim](https://github.com/lewis6991/impatient.nvim) -- cache plugins

![Cache Example](https://github.com/dannylongeuay/workstation-bootstrap/blob/assets/cache.png)

## Motivation

Create a reliable way to bootstrap a developer workstation. Level-up the
development environment with a modern shell and tool set.

Support managing cloud resources, AWS and DigitalOcean, with infrastructure as code,
Terraform and Pulumi. Package, develop, and deploy apps with kubectl, kubeseal, helm,
k3d, and tilt. Build services with python, golang, and javascript/typescript.
