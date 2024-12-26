#!/bin/bash

# ---------------------------------
# ghostware.sh | By g5ostXa | 2024
# ---------------------------------
check_cloned_repo() {
	if [ ! -d "$HOME/Downloads/$OPTION" ]; then
		echo -e "${RED};; Failed to Download $OPTION${RC}"
	else
		echo -e "${CYAN};; $OPTION successfully Downloaded!${RC}"
	fi

}

is_installed_figlet() {
	if command -v figlet >/dev/null 2>&1; then
		echo -e "${CYAN}"
		clear && figlet -f smslant "ghostware"
		echo -e "${RC}"
		echo ""
	else
		clear
		echo -e "${CYAN}"
		echo "-------------------"
		echo "ghostware.sh"
		echo "-------------------"
		echo -e "${RC}" && echo ""
	fi

}

is_installed_gum() {
	if ! command -v gum >/dev/null 2>&1; then
		echo -e "${YELLOW};; gum needs to be installed to run this script...${RC}"
		echo -e "${YELLOW};; Type 'sudo pacman -S gum' to install, then run this script again.${RC}"
		cd || exit
		exit 1
	fi

}

is_installed_git() {
	if ! command -v git >/dev/null 2>&1; then
		echo -e "${YELLOW};; git is not installed...${RC}"
		echo -e "${YELLOW};; Type 'sudo pacman -S git' to install, then run this script again.${RC}"
		cd || exit
		exit 1
	fi

}

choose_option() {
	set -e
	cd ~/Downloads || exit
	is_installed_figlet
	is_installed_gum
	echo -e "${CYAN};; Select one of g5ostXa's projects to download:${RC}"
	echo ""

	OPTION=$(gum choose "hyprarch2" "g5ostXa" "b4shL4nd" "archSec" "wallpaper" "g5ost4rchives" "CANCEL")
	if [[ -n "$OPTION" ]]; then
		if [[ ! "$OPTION" == "CANCEL" ]]; then
			gum spin --spinner points --title "Installing $OPTION..." -- sleep 3
			is_installed_git
			git clone --depth 1 https://github.com/g5ostXa/"$OPTION".git
			cd || exit
			check_cloned_repo
		else
			echo -e "${YELLOW};; Operation canceled...${RC}"
			cd || exit
			exit 0
		fi
	else
		echo -e "${RED};; Variable not set: $OPTION${RC}"
		cd || exit
		exit 1
	fi

}

# Define colors / script start
YELLOW='\033[0;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RC='\033[0m'

choose_option
