#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing Go Tools #####\n\n"

. $HOME/.asdf/asdf.sh

# Go binaries
export GOBIN=$HOME/.local/bin

declare -A arr1=(
    [bin]="swag"
    [url]="github.com/swaggo/swag/cmd/swag@latest"
)

declare -A arr2=(
    [bin]="golangci-lint"
    [url]="github.com/golangci/golangci-lint/cmd/golangci-lint@latest"
)

declare -A arr3=(
    [bin]="slides"
    [url]="github.com/maaslalani/slides@latest"
)

declare -A arr4=(
    [bin]="dlv"
    [url]="github.com/go-delve/delve/cmd/dlv@latest"
)

declare -A arr5=(
    [bin]="gopls"
    [url]="golang.org/x/tools/gopls@latest"
)

declare -A arr6=(
    [bin]="fx"
    [url]="github.com/antonmedv/fx@latest"
)

refs=("${!arr@}")

declare -n ref

for ref in "${refs[@]}"
do
  if ! which "${ref[bin]}" > /dev/null || [ $FORCE == true ]
  then
      printf "Installing %s...\n" "${ref[bin]}"
      go install "${ref[url]}"
  else
      printf "Already installed %s...\n" "${ref[bin]}"
    fi
done
