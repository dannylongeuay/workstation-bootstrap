#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing Crates #####\n\n"

. $HOME/.asdf/asdf.sh

declare -A arr1=(
    [bin]="stylua"
    [crate]="stylua"
)

declare -A arr2=(
    [bin]="taplo"
    [crate]="taplo-cli"
)

refs=("${!arr@}")

declare -n ref

for ref in "${refs[@]}"
do
  if ! which "${ref[bin]}" > /dev/null || [ $FORCE == true ]
  then
      printf "Installing %s...\n" "${ref[crate]}"
      cargo install --root ~/.cargo "${ref[crate]}"
  else
      printf "Already installed %s...\n" "${ref[crate]}"
  fi
done
