#!/bin/bash

source "./utils.sh"

clear

print_message "» Starting setup..." "yellow"

sudo true

print_message "» Config dpkg" "yellow"
sudo dpkg --configure -a

print_message "» Updating apt..." "yellow"
sudo apt update
print_message "» finished" "yellow"

print_message "» Installing apt-transport-https, ca-certificates, software-properties-common..." "yellow"
sudo apt install apt-transport-https ca-certificates software-properties-common make
print_message "» finished" "yellow"

print_message "» Installing curl..." "yellow"
sudo apt-get update
sudo apt-get install curl

print_message "» Installing some languages..." "yellow"
print_message "» Installing ruby...
sudo apt-get install ruby-full
print_message "» Installing golang...
sudo apt install golang-go
print_message "» Installing php..."
sudo apt install php7.4-cli
print_message "» finished" "yellow"

# git
print_message "» Installing git..." "yellow"
sudo apt install git
print_message "» finished" "yellow"

print_message "» Config git..." "yellow"
git --version
read -p "Enter your name [Matheus Porto]: " GIT_USER_NAME
git config --global user.name $GIT_USER_NAME
read -p "Enter your name [matheusporto@email.com]: " GIT_USER_EMAIL
git config --global user.email $GIT_USER_EMAIL
print_message "» finished" "yellow"

# ohmyzsh
print_message "» Installing oh my zsh..."
sudo apt-get install zsh
sudo apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
zsh --version
print_message "» Setting oh my zsh as default..." "yellow"
echo "export SHELL=/bin/zsh" >> ~/.bashrc
echo "/bin/zsh -l" >> ~/.bashrc
print_message "» finished" "yellow"

# nvm
print_message "» Installing nvm..." "yellow"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
~/.zshrc

echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc

command -v nvm

# snap
print_message "» Installing snap..." "yellow"
sudo apt install snapd
print_message "» finished" "yellow"

# apps
print_message "» Installing apps with snap..." "yellow"

# google chrome
print_message "» Installing chrome..." "yellow"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install google-chrome-stable

# vscode
print_message "» Installing vscode..." "yellow"
sudo snap install --classic code
print_message "» finished" "yellow"

# sublime
sudo snap install sublime-text --classic

# chromium
print_message "» Installing chromium..." "yellow"
sudo snap install chromium

# dbeaver
print_message "» Installing dbeaver..." "yellow"
sudo snap install dbeaver-ce

# slack
print_message "» Installing slack..." "yellow"
sudo snap install slack --classic

# spotify
print_message "» Installing spotify..." "yellow"
sudo snap install spotify

# remmina
print_message "» Installing remmina..." "yellow"
sudo snap install remmina
