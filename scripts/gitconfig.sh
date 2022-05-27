#!/bin/bash

printf "\n##### Configuring GIT #####\n\n"

printf "Updating global settings\n"

git config --global advice.statusHints false

git config --global color.ui true

git config --global core.editor hx
git config --global core.pager delta

git config --global delta.navigate true
git config --global delta.line-numbers true
git config --global delta.side-by-side true

git config --global diff.colorMoved default

git config --global fetch.prune true

git config --global interactive.diffFilter "delta --color-only"

git config --global merge.conflictstyle diff3

git config --global pull.ff only

git config --global push.default simple
