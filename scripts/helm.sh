#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing Helm Plugins #####\n\n"

. $HOME/.asdf/asdf.sh

declare -A arr1=(
    [cmd]="diff"
    [url]="https://github.com/databus23/helm-diff"
)

refs=("${!arr@}")

declare -n ref

for ref in "${refs[@]}"
do
  if ! helm plugin list | grep "${ref[cmd]}" > /dev/null || [ $FORCE == true ]
  then
      printf "Installing %s...\n" "${ref[cmd]}"
      helm plugin install "${ref[url]}" > /dev/null || true
  else
      printf "Already installed %s...\n" "${ref[cmd]}"
  fi
done

