source "../utils.sh"

print_message "» Installing oh my zsh..." "red"
sudo apt-get install zsh
sudo apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
zsh --version
print_message "» Setting oh my zsh as default..." "yellow"
echo "export SHELL=/bin/zsh" >> ~/.bashrc
echo "/bin/zsh -l" >> ~/.bashrc
