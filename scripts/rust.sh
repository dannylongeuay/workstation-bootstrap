#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing Crates/Components/Targets #####\n\n"

. $HOME/.asdf/asdf.sh

declare -A arr1=(
    [bin]="stylua"
    [crate]="stylua"
)

declare -A arr2=(
    [bin]="taplo"
    [crate]="taplo-cli"
)

declare -A arr3=(
    [bin]="just"
    [crate]="just"
)

refs=("${!arr@}")

declare -n ref

if [ ! -d ~/.cargo/bin ]
then
  mkdir -p ~/.cargo/bin
fi

for ref in "${refs[@]}"
do
  if ! which "${ref[bin]}" > /dev/null || [ $FORCE == true ]
  then
    printf "Installing crate %s...\n" "${ref[crate]}"
    cargo install --root ~/.cargo "${ref[crate]}"
  else
    printf "Already installed crate %s...\n" "${ref[crate]}"
  fi
done

declare -A brr1=(
    [component]="rust-analyzer"
    [match]="rust-analyzer"
)

refs=("${!brr@}")

declare -n ref

for ref in "${refs[@]}"
do
  if ! rustup component list --installed | grep "${ref[match]}" > /dev/null || [ $FORCE == true ]
  then
    printf "Installing component %s...\n" "${ref[component]}"
    rustup component add "${ref[component]}"
  else
    printf "Already installed component %s...\n" "${ref[component]}"
  fi
done

declare -A crr1=(
    [target]="wasm32-unknown-unknown"
    [match]="wasm32-unknown-unknown"
)

refs=("${!crr@}")

declare -n ref

for ref in "${refs[@]}"
do
  if ! rustup target list --installed | grep "${ref[match]}" > /dev/null || [ $FORCE == true ]
  then
    printf "Installing target %s...\n" "${ref[target]}"
    rustup target add "${ref[target]}"
  else
    printf "Already installed target %s...\n" "${ref[target]}"
  fi
done
