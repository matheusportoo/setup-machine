source "../utils.sh"

print_message "» Installing git..." "red"
sudo apt install git

print_message "» Config git..." "red"
git --version
read -p "Enter your name [Matheus Porto]: " GIT_USER_NAME
git config --global user.name $GIT_USER_NAME
read -p "Enter your name [matheusporto@email.com]: " GIT_USER_EMAIL
git config --global user.email $GIT_USER_EMAIL
