#!/bin/bash

# --------------------------------------------
# aurhelper.sh | By g5ostXa | 2024
# --------------------------------------------

# Script to install your favorite AUR helper on Archlinux.
# Requires: figlet | gum | git

# Define colors
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
RC='\033[0m'

clear

# Check if figlet is installed
is_installed_figlet() {
	if ! command -v figlet >/dev/null 2>&1; then
		echo -e "${RED};; figlet is not installed...${RC}"
		exit 1
	fi

}

# Check if gum is installed
is_installed_gum() {
	if ! command -v gum >/dev/null 2>&1; then
		echo -e "${RED};; gum is not installed...${RC}"
		exit 1
	fi

}

# Check if git is installed
is_installed_git() {
	if ! command -v git >/dev/null 2>&1; then
		echo -e "${RED};; git is not installed...${RC}"
		exit 1
	fi

}

# Run checks and display figlet banner
is_installed_figlet
echo -e "${CYAN}"
figlet -f smslant "aurhelper.sh"
echo -e "${RC}" && echo ""
is_installed_gum
is_installed_git

# Run main operation if all checks passed
echo -e "${YELLOW};; Please choose option:${RC}" && echo ""
AUR_HELPER=$(gum choose "yay" "paru" "aura" "CANCEL")

set -e

if [ -n "$AUR_HELPER" ]; then
	if [[ ! "$AUR_HELPER" == "CANCEL" ]]; then
		cd && git clone https://aur.archlinux.org/"$AUR_HELPER"-bin
		cd "$AUR_HELPER"-bin && makepkg -si && cd
	else
		echo -e "${RED};; Operation canceled... :(${RC}"
		exit
	fi
else
	exit
fi
