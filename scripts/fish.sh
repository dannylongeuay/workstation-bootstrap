#!/bin/fish

printf "\n##### Configuring Fish #####\n\n"

sudo chsh -s (which fish) $USER
printf "Setting fish as the default shell\n"

if test ! -d ~/.config/fish/completions
  mkdir -p ~/.config/fish/completions 
end

if test ! -L ~/.config/fish/completions/asdf.fish
  ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end

if test ! -d ~/.local/bin
  mkdir -p ~/.local/bin
end

if test ! -L /usr/local/sbin/fd
  sudo ln -s /usr/bin/fdfind /usr/local/sbin/fd
end

if test ! -L /usr/local/sbin/bat
  sudo ln -s /usr/bin/batcat /usr/local/sbin/bat
end

if test ! (fisher list | grep fisher)
  curl -sL https://git.io/fisher | source && \
  fisher install jorgebucaran/fisher
end

if test ! (fisher list | grep fzf.fish)
  fisher install PatrickF1/fzf.fish
end

if test ! (fisher list | grep fish-kubectl-completions)
  fisher install evanlucas/fish-kubectl-completions
end
