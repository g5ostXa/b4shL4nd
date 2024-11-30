#!/bin/bash

# -----------------------------------------
# random.sh | By g5ostXa | 2024
# -----------------------------------------
is_randnum_0() {
	if [[ "$RANDOM_NUMBER" == "0" ]]; then
		set -e
		gum spin --spinner points --title "Getting your IP..." -- sleep 5 && echo ";; Your IP address is $(curl -s ifconfig.me)"
	fi

}

is_randnum_1() {
	if [[ "$RANDOM_NUMBER" == "1" ]]; then
		set -e
		gum spin --spinner points --title "Sleeping for 10 seconds..." -- sleep 10
	fi

}

is_randnum_2() {
	if [[ "$RANDOM_NUMBER" == "2" ]]; then
		echo "Not defined yet..."
	fi

}

is_randnum_3() {
	if [[ "$RANDOM_NUMBER" == "3" ]]; then
		echo "Not defined yet..."
	fi

}

is_randnum_4() {
	if [[ "$RANDOM_NUMBER" == "4" ]]; then
		echo "Not defined yet..."
	fi

}

is_randnum_5() {
	if [[ "$RANDOM_NUMBER" == "5" ]]; then
		echo "Not defined yet..."
	fi

}

is_randnum_6() {
	if [[ "$RANDOM_NUMBER" == "6" ]]; then
		echo "Not defined yet..."
	fi

}

is_randnum_7() {
	if [[ "$RANDOM_NUMBER" == "7" ]]; then
		echo "Not defined yet..."
	fi

}

is_randnum_8() {
	if [[ "$RANDOM_NUMBER" == "8" ]]; then
		echo "Not defined yet..."
	fi

}

is_randnum_9() {
	if [[ "$RANDOM_NUMBER" == "9" ]]; then
		echo "Not defined yet..."
	fi

}

is_randnum_10() {
	if [[ "$RANDOM_NUMBER" == "10" ]]; then
		echo "Not defined yet..."
	fi

}

# Check if figlet is installed
is_installed_figlet() {
	if command -v figlet >/dev/null 2>&1; then
		clear && figlet -f smslant "random.sh" && echo ""
	else
		clear
		echo "--------------------"
		echo "random.sh"
		echo "--------------------"
	fi

}

# Check if gum is installed
is_installed_gum() {
	if ! command -v gum >/dev/null 2>&1; then
		echo ";; gum is not installed..."
		exit 1
	fi

}

main_operation() {
	is_installed_figlet
	echo ";; Please pick any number between 0 and 10 to continue, or hit CANCEL to exit:"

	is_installed_gum && echo ""
	RANDOM_NUMBER=$(gum choose "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "CANCEL")
	if [[ -n "$RANDOM_NUMBER" ]]; then
		if [[ ! "$RANDOM_NUMBER" == "CANCEL" ]]; then
			echo ";; Your random number is: $RANDOM_NUMBER"
			is_randnum_0
			is_randnum_1
			is_randnum_2
			is_randnum_3
			is_randnum_4
			is_randnum_5
			is_randnum_6
			is_randnum_7
			is_randnum_8
			is_randnum_9
			is_randnum_10
		else
			echo ";; Exiting..."
			exit 0
		fi
	else
		echo ";; Failed with exit code '1'" && sleep 3
		exit 1
	fi

}

# Script start
main_operation
