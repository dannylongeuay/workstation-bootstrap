#!/bin/bash
set -e

FORCE=$1

printf "\n##### Installing Language Servers #####\n\n"

if ! which lua-language-server > /dev/null || [ $FORCE == true ]
then
    printf "lua-language-server installing...\n"
    rm ~/.local/bin/lua-language-server || true
    curl -o /tmp/lua-language-server.tar.gz -L https://github.com/sumneko/lua-language-server/releases/download/3.2.3/lua-language-server-3.2.3-linux-x64.tar.gz
    mkdir -p ~/.local/share/lsp/lua-language-server
    tar -xzf /tmp/lua-language-server.tar.gz -C ~/.local/share/lsp/lua-language-server
    ln -s ~/.local/share/lsp/lua-language-server/bin/lua-language-server ~/.local/bin/lua-language-server
    rm -f /tmp/lua-language-server.tar.gz
else
    printf "lua-language-server already installed...\n"
fi

if ! which ltex-ls > /dev/null || [ $FORCE == true ]
then
    printf "ltex-ls installing...\n"
    rm ~/.local/bin/ltex-ls || true
    curl -o /tmp/ltex-ls.tar.gz -L https://github.com/valentjn/ltex-ls/releases/download/15.2.0/ltex-ls-15.2.0-linux-x64.tar.gz
    mkdir -p ~/.local/share/lsp/ltex-ls
    tar -xzf /tmp/ltex-ls.tar.gz -C ~/.local/share/lsp/ltex-ls
    ln -s ~/.local/share/lsp/ltex-ls/ltex-ls-15.2.0/bin/ltex-ls ~/.local/bin/ltex-ls
    rm -f /tmp/ltex-ls.tar.gz
else
    printf "ltex-ls already installed...\n"
fi

if ! which terraform-ls > /dev/null || [ $FORCE == true ]
then
    printf "terraform-ls installing...\n"
    curl -o /tmp/terraform-ls.zip https://releases.hashicorp.com/terraform-ls/0.27.0/terraform-ls_0.27.0_linux_amd64.zip    
    unzip /tmp/terraform-ls.zip -d /tmp/terraform-ls
    mv /tmp/terraform-ls/terraform-ls ~/.local/bin/terraform-ls
    chmod +x ~/.local/bin/terraform-ls
    rm -f /tmp/terraform-ls.zip
    rmdir /tmp/terraform-ls
else
    printf "terraform-ls already installed...\n"
fi
