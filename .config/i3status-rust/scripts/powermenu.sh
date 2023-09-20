#!/usr/bin/bash

if [ "$XDG_CURRENT_DESKTOP" = "sway" ]; then
	if pgrep -x "swaynag" >/dev/null; then
		pkill swaynag
	else
		swaynag -t warning -m 'Power Menu Options' \
			-Z '  Logout' 'swaymsg exit' \
			-Z '󰒲  Suspend' 'systemctl suspend' \
			-Z '  Reboot' 'systemctl reboot' \
			-Z '  Poweroff' 'systemctl poweroff' \
			-Z ' Lock' 'swaylock -i ~/drive-local/background.jpg' \
			--font='Iosevka Nerd Font 13' --edge=top --text=#eceff4 --background=#4c566a \
			--button-text=#eceff4 --button-background=#5e81ac --button-padding=4 \
			--border=#5e81ac --border-bottom-size=0
	fi
fi
