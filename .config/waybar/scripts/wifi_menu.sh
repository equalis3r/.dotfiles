#!/usr/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
DEVICE="$(iwctl device list | grep wl | awk '{print $1}')"
NETWORKS="$(iwctl station "$DEVICE" get-networks | sed -r "s/>/ /g")"
HEADER="$(echo "$NETWORKS" | head -n 4 | tail -n 3 | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g")"
NETWORKS="$(echo "$NETWORKS" | tail -n +5)"
echo -e "$HEADER\n$NETWORKS"

while true; do
	echo -e "${GREEN}Press s to scan network, c to choose network, q to quit${NC}"
	read -rsn1 OPTION
	case "$OPTION" in
	's')
		iwctl station "$DEVICE" scan
		sleep 1
		NETWORKS="$(iwctl station "$DEVICE" get-networks | tail -n +5 | sed -r "s/>/ /g")"
		echo -e "$HEADER\n$NETWORKS"
		;;

	'c')
		SSID="$(echo "$NETWORKS" | awk -F' ' 'BEGIN { OFS = FS} {NF--;print}' | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' -e 's/\(.*\) /\1./' | fzf)"
		echo "Network name: $SSID"
		PASSWORD=$(systemd-ask-password "Password: ")
		ERROR="$(iwctl --passphrase "$PASSWORD" station "$DEVICE" connect "$SSID" 2>&1)"
		ERROR=$(echo "$ERROR" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g")
		case $ERROR in
		"Argument format is invalid")
			echo -e "${RED}Password is too short${NC}"
			;;
		"Operation failed")
			echo -e "${RED}Passwrong is wrong${NC}"
			;;

		"Message recipient disconnected from message bus without replying")
			echo -e "${RED}Failed to connect to network $SSID${NC}"
			;;

		"Operation already in progress")
			echo -e "${RED}Please wait${NC}"
			;;

		*)
			echo -e "${GREEN}Succefully connected to $SSID${NC}"
			exit 0
			;;
		esac
		;;

	'q')
		exit 0
		;;

	*)
		exit 0
		;;
	esac
done

exit 1
