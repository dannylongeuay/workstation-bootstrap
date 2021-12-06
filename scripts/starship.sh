#!/bin/bash

printf "\n##### Installing Starship Prompt #####\n\n"

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y | grep Starship
