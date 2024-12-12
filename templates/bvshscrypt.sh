#!/bin/bash

# ----------------------------
# bvshscrypt.sh
# ----------------------------
is_installed_figlet() {
	if command -v figlet >/dev/null 2>&1; then
		clear && figlet -f smslant "bvshscrypt.sh" && echo ""
	else
		clear && echo ""
		echo "----------------"
		echo "bvshscrypt.sh"
		echo "----------------" && echo ""
	fi

}

main_operation() {
	is_installed_figlet
	if ! command -v gum >/dev/null 2>&1; then
		echo ";; gum not installed..." && exit 1
	else
		echo ";; Please select an option:" && echo ""
		MYCMD=$(gum choose "opt1" "opt2" "opt3" "CANCEL")
		if [[ -n "$MYCMD" ]]; then
			if [[ ! "$MYCMD" == "CANCEL" ]]; then
				gum spin --spinner points --title "Running $MYCMD..." -- sleep 5
			else
				echo ";; Canceled..." && exit 0
			fi
		else
			echo ";; Variable $MYCMD not set..." && exit 1
		fi
	fi

}

# Script start
main_operation
