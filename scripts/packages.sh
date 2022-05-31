#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing OS Packages #####\n\n"

# Setup apt sources
declare -A arr1=(
    [keyring_path]="/usr/share/keyrings/githubcli-archive-keyring.gpg"
    [keyring_url]="https://cli.github.com/packages/githubcli-archive-keyring.gpg"
    [source_path]="/etc/apt/sources.list.d/github-cli.list"
    [source_url]="https://cli.github.com/packages stable main"
)

declare -A arr2=(
    [keyring_path]="/usr/share/keyrings/docker-archive-keyring.gpg"
    [keyring_url]="https://download.docker.com/linux/ubuntu/gpg"
    [source_path]="/etc/apt/sources.list.d/docker.list"
    [source_url]="https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
)


apt_sources=("${!arr@}")

declare -n ref

for ref in "${apt_sources[@]}"
do
    if [ ! -f "${ref[keyring_path]}" ] || [ $FORCE == true ]
    then
        printf "Adding source url %s to source path %s...\n" "${ref[source_url]}" "${ref[source_path]}"
        sudo rm -f "${ref[keyring_path]}"
        curl -fsSL "${ref[keyring_url]}"| sudo gpg --dearmor -o "${ref[keyring_path]}"
        echo "deb [arch=$(dpkg --print-architecture) signed-by=${ref[keyring_path]}] ${ref[source_url]}" \
        | sudo tee "${ref[source_path]}" > /dev/null
    fi
done

if ! sudo apt-add-repository -L | grep fish-shell > /dev/null || [ $FORCE == true ]
then
    sudo apt-add-repository -y ppa:fish-shell/release-3
fi

# Update and install packages
sudo apt update > /dev/null

sudo apt install -y curl fish gawk gh git make tmux tree vim build-essential \
libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
coreutils ca-certificates gnupg lsb-release whois dnsutils dirmngr gpg xclip \
ripgrep pandoc screenkey texlive entr
