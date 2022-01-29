#!/usr/bin/bash

# Need to run weather.zsh first
NOW=$(date +%s)
SUNRISE=$(jq -r '.sunrise' ~/.cache/clock.json)
SUNSET=$(jq -r '.sunset' ~/.cache/clock.json)

if ((NOW > SUNSET || NOW < SUNRISE)); then
	TIME_ICON=""
else
	TIME_ICON=""
fi

NOW=$(date +%H:%M)
SUNRISE=$(date -d @"$SUNRISE" +%H:%M)
SUNSET=$(date -d @"$SUNSET" +%H:%M)

echo -e "{\"text\":\"$TIME_ICON <span font-family='FiraCode Nerd Font'>$NOW</span>\", \"tooltip\":\" <span font-family='FiraCode Nerd Font'>$SUNRISE</span>\r <span font-family='FiraCode Nerd Font'>$SUNSET</span>\"}"
