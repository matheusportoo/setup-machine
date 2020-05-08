#!/bin/bash
source "../utils.sh"

clear
print_message "» Starting setup... 🔨 🍺" "purple"

print_message "» Config dpkg" "green"
sudo dpkg --configure -a

sudo apt update
sudo apt-get update

# installing essential proograms
apt_install_from "./essentials.sh" "green"

# installing and config git, ohmyzsh, nvm
chmod +x ./git.sh && ./git.sh
chmod +x ./ohmyzsh.sh && ./ohmyzsh.sh
chmod +x ./nvm.sh && ./nvm.sh

# installing essential languages
apt_install_from "./languages.sh" "cyan"

# installing apps via snap
snap_install_from "./apps.sh" "yellow"

print_message "» Finish setup, maybe you need to relauch the system... 🔨 🍺 😎" "purple"
