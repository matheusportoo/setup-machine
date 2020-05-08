#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

function print_message () {
  # $1 -> message
  # $2 -> color

  case "$2" in
    "red") echo -e "\n${RED}$1${NC}" ;;
    "green") echo -e "\n${GREEN}$1${NC}" ;;
    "yellow") echo -e "\n${YELLOW}$1${NC}" ;;
    "blue") echo -e "\n${BLUE}$1${NC}" ;;
    "purple") echo -e "\n${PURPLE}$1${NC}" ;;
    "cyan") echo -e "\n${CYAN}$1${NC}" ;;

    *) echo -e "\n $1 $3" ;;
  esac
}

function apt_install_from () {
  # $1 - filename
  # $2 - color
  # $line -> <package-manager (apt||apt-get)> <name>

  while IFS= read -r line; do
    command=($line)
    print_message "» Installing ${command[1]}..." "$2"
    echo "sudo ${command[0]} install ${command[1]}"
  done < "$1"
}

function snap_install_from () {
  # $1 - filename
  # $2 - color
  # $line -> <app-name>
  while IFS= read -r app; do
    print_message "» Installing $app..." "$2"
    echo "sudo snap install $app"
  done < "$1"
}

export -f print_message
export -f apt_install_from
export -f snap_install_from
