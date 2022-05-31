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

if test ! -f ~/.config/fish/functions/fisher.fish || $argv[1] == true
  curl -sL https://git.io/fisher | source && \
  fisher install jorgebucaran/fisher
end

if test ! (fisher list | grep fzf.fish) || $argv[1] == true
  fisher install PatrickF1/fzf.fish
end

if test ! (fisher list | grep fish-kubectl-completions) || $argv[1] == true
  fisher install evanlucas/fish-kubectl-completions
end
