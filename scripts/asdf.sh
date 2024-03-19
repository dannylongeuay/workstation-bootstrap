#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing ASDF #####\n\n"

mkdir -p $HOME/.local/bin

# Install ASDF
if [ ! -d "$HOME/.asdf" ]
then
    rm -rf "$HOME/.asdf"
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.1 > /dev/null || true
else
    . $HOME/.asdf/asdf.sh
    asdf update
    asdf plugin update --all
fi

. $HOME/.asdf/asdf.sh

declare -A arr1=(
    [tool_binary]="aws"
    [tool_name]="awscli" 
    [tool_version]="latest"
    [tool_url]=""
)

declare -A arr2=(
    [tool_binary]="bat"
    [tool_name]="bat" 
    [tool_version]="latest"
    [tool_url]=""
)

declare -A arr3=(
    [tool_binary]="cargo"
    [tool_name]="rust" 
    [tool_version]="1.71.1"
    [tool_url]=""
)

declare -A arr4=(
    [tool_binary]="delta"
    [tool_name]="delta" 
    [tool_version]="latest"
    [tool_url]=""
)

declare -A arr5=(
    [tool_binary]="doctl"
    [tool_name]="doctl" 
    [tool_version]="1.76.2"
    [tool_url]=""
)

declare -A arr6=(
    [tool_binary]="duf"
    [tool_name]="duf" 
    [tool_version]="latest"
    [tool_url]=""
)

declare -A arr7=(
    [tool_binary]="eza"
    [tool_name]="eza" 
    [tool_version]="latest"
    [tool_url]=""
)

declare -A arr8=(
    [tool_binary]="fd"
    [tool_name]="fd" 
    [tool_version]="latest"
    [tool_url]=""
)

declare -A arr9=(
    [tool_binary]="fzf"
    [tool_name]="fzf" 
    [tool_version]="0.30.0"
    [tool_url]=""
)

declare -A arr10=(
    [tool_binary]="go"
    [tool_name]="golang" 
    [tool_version]="1.19.1"
    [tool_url]=""
)

declare -A arr11=(
    [tool_binary]="helm"
    [tool_name]="helm" 
    [tool_version]="3.9.0"
    [tool_url]=""
)

declare -A arr12=(
    [tool_binary]="ht"
    [tool_name]="httpie-go" 
    [tool_version]="0.7.0"
    [tool_url]=""
)

declare -A arr13=(
    [tool_binary]="k3d"
    [tool_name]="k3d" 
    [tool_version]="5.4.1"
    [tool_url]=""
)

declare -A arr14=(
    [tool_binary]="k9s"
    [tool_name]="k9s" 
    [tool_version]="0.27.4"
    [tool_url]=""
)

declare -A arr15=(
    [tool_binary]="kubectl"
    [tool_name]="kubectl" 
    [tool_version]="1.22.2"
    [tool_url]=""
)

declare -A arr16=(
    [tool_binary]="node"
    [tool_name]="nodejs" 
    [tool_version]="16.13.0"
    [tool_url]=""
)

declare -A arr17=(
    [tool_binary]="poetry"
    [tool_name]="poetry" 
    [tool_version]="latest"
    [tool_url]=""
)

declare -A arr18=(
    [tool_binary]="pulumi"
    [tool_name]="pulumi" 
    [tool_version]="latest"
    [tool_url]=""
)

declare -A arr19=(
    [tool_binary]="python"
    [tool_name]="python" 
    [tool_version]="3.9.4"
    [tool_url]=""
)

declare -A arr20=(
    [tool_binary]="sops"
    [tool_name]="sops" 
    [tool_version]="3.7.3"
    [tool_url]=""
)

declare -A arr21=(
    [tool_binary]="terraform"
    [tool_name]="terraform" 
    [tool_version]="latest"
    [tool_url]=""
)

declare -A arr22=(
    [tool_binary]="tilt"
    [tool_name]="tilt" 
    [tool_version]="0.30.1"
    [tool_url]=""
)

declare -A arr23=(
    [tool_binary]="zoxide"
    [tool_name]="zoxide" 
    [tool_version]="0.8.3"
    [tool_url]=""
)

declare -A arr24=(
    [tool_binary]="ansible"
    [tool_name]="ansible-base" 
    [tool_version]="latest"
    [tool_url]="https://github.com/amrox/asdf-pyapp.git"
)

declare -A arr25=(
    [tool_binary]="bpytop"
    [tool_name]="bpytop" 
    [tool_version]="latest"
    [tool_url]="https://github.com/amrox/asdf-pyapp.git"
)

declare -A arr26=(
    [tool_binary]="java"
    [tool_name]="java" 
    [tool_version]="openjdk-18.0.1"
    [tool_url]=""
)

declare -A arr27=(
    [tool_binary]="glab"
    [tool_name]="glab" 
    [tool_version]="1.22.0"
    [tool_url]=""
)

declare -A arr28=(
    [tool_binary]="flux"
    [tool_name]="flux2" 
    [tool_version]="0.31.3"
    [tool_url]=""
)

declare -A arr29=(
    [tool_binary]="btm"
    [tool_name]="bottom" 
    [tool_version]="0.9.6"
    [tool_url]=""
)

declare -A arr30=(
    [tool_binary]="watchexec"
    [tool_name]="watchexec" 
    [tool_version]="latest"
    [tool_url]=""
)

declare -A arr31=(
    [tool_binary]="zellij"
    [tool_name]="zellij" 
    [tool_version]="latest"
    [tool_url]=""
)

tools=("${!arr@}")

declare -n ref

for ref in "${tools[@]}"
do
    if ! which "${ref[tool_binary]}" > /dev/null || [ $FORCE == true ]
    then
        printf "\n##### Installing %s #####\n\n" "${ref[tool_name]}"
        asdf plugin add "${ref[tool_name]}" "${ref[tool_url]}" > /dev/null || true
        asdf install "${ref[tool_name]}" "${ref[tool_version]}"
        asdf global "${ref[tool_name]}" "${ref[tool_version]}"
    fi
done

