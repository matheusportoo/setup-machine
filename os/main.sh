#!/bin/bash
source "../utils.sh"

clear
print_message "» Starting setup... 🔨 🍺" "purple"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew update

# installing essential tools
brew_install_from "./scripts/essentials.sh" "green"

# installing and config git, ohmyzsh, nvm
cd scripts
chmod +x ./git.sh && ./git.sh
chmod +x ./ohmyzsh.sh && ./ohmyzsh.sh
chmod +x ./nvm.sh && ./nvm.sh
cd ..

# installing apps via brew cask
brew_cask_install_from "./scripts/apps.sh" "yellow"

print_message "» Finished setup, maybe you need to relauch the system... 🔨 🍺 😎" "purple"
