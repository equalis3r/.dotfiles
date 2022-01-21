#!/bin/sh
if pgrep -x "swaynag" >/dev/null; then
	pkill swaynag
else
	swaynag -t warning -m 'Power Menu Options' \
		-b 'Logout' 'swaymsg exit' \
		-b 'Suspend' 'systemctl suspend' \
		-b 'Reboot' 'systemctl reboot' \
		-b 'Shutdown' 'systemctl poweroff' \
		-b 'Lock' 'swaylock -i ~/Pictures/w1.jpg' \
		--font='FiraCode Nerd Font 13' --edge=bottom --text=#eceff4 --background=#4c566a \
		--button-text=#eceff4 --button-background=#5e81ac --button-padding=4 \
		--border=#5e81ac --border-bottom-size=0
fi
