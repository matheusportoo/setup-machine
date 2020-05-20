source "../../utils.sh"

print_message "» Installing oh my zsh..." "red"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh --version

print_message "» Setting oh my zsh as default..." "red"
echo "export SHELL=/bin/zsh" >> ~/.bashrc
echo "/bin/zsh -l" >> ~/.bashrc
