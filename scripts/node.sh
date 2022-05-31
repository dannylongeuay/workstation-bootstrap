#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing Node Packages #####\n\n"

. $HOME/.asdf/asdf.sh

declare -A arr1=(
    [bin]="cz"
    [packages]="commitizen cz-emoji"
)

declare -A arr2=(
    [bin]="fx"
    [packages]="fx"
)

declare -A arr3=(
    [bin]="live-server"
    [packages]="live-server"
)

declare -A arr4=(
    [bin]="bash-language-server"
    [packages]="bash-language-server"
)

declare -A arr5=(
    [bin]="docker-langserver"
    [packages]="dockerfile-language-server-nodejs"
)

declare -A arr6=(
    [bin]="vscode-json-language-server"
    [packages]="vscode-langservers-extracted"
)

declare -A arr7=(
    [bin]="svelteserver"
    [packages]="svelte-language-server"
)

declare -A arr8=(
    [bin]="yaml-language-server"
    [packages]="yaml-language-server"
)

declare -A arr9=(
    [bin]="typescript-language-server"
    [packages]="typescript typescript-language-server"
)

refs=("${!arr@}")

declare -n ref

for ref in "${refs[@]}"
do
  if ! which "${ref[bin]}" > /dev/null || [ $FORCE == true ]
  then
      printf "Installing packages %s...\n" "${ref[packages]}"
      npm install -g ${ref[packages]}
  else
      printf "Packages %s already installed...\n" "${ref[packages]}"
  fi
done
