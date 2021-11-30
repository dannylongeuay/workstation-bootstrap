#!/bin/fish

printf "\n##### Configuring Fish #####\n\n"

sudo chsh -s (which fish) $USER

mkdir -p ~/.config/fish/completions 

if test -L ~/.config/fish/completions/asdf.fish
  printf "ASDF Completions Symlink Exists"
else
  printf "ASDF Completions Symlink Created"
  ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end

mkdir -p ~/.local/bin

if test -L /usr/local/sbin/fd
  printf "fd Symlink Exists"
else
  printf "fd Symlink Created"
  sudo ln -s /usr/bin/fdfind /usr/local/sbin/fd
end

if test -L /usr/local/sbin/bat
  printf "bat Symlink Exists"
else
  printf "bat Symlink Created"
  sudo ln -s /usr/bin/batcat /usr/local/sbin/bat
end

curl -sL https://git.io/fisher | source && \
fisher install jorgebucaran/fisher && \
fisher install PatrickF1/fzf.fish
