#!/usr/bin/bash

# If set to auto, will use geoclue to determine location
auto=false
cachedir=$HOME/.cache
cacheloc=location.txt

if [ ! -d "$cachedir" ]; then
	mkdir -p "$cachedir"
fi

if [ ! -f "$cachedir/$cacheloc" ]; then
	touch "$cachedir/$cacheloc"
fi

cachelocage=$(($(date +%s) - $(stat -c '%Y' "$cachedir/$cacheloc")))
if $auto && [ $cachelocage -gt 43200 ] || [ ! -s "$cachedir/$cacheloc" ]; then
	/usr/lib/geoclue-2.0/demos/where-am-i >"$cachedir/$cacheloc"
else
	printf "Latitude: 50.8376226°\nLongitude: 5.6559255°" >"$cachedir/$cacheloc"
fi

IFS=":" read -r LAT <<<"$(grep "Lat" "$cachedir/$cacheloc" | head -1)"
IFS=":" read -r LON <<<"$(grep "Lon" "$cachedir/$cacheloc" | head -1)"
LAT=$(printf '%s' "$LAT" | sed 's/[^0-9.]//g')
LON=$(printf '%s' "$LON" | sed 's/[^0-9.]//g')
# Openweather apikey
APIKEY="172d9bcd52349d130e5b0c5bf4adf7f6"
URL="http://api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&units=metric&appid=${APIKEY}"
WEATHER_JSON=$(wget -qO- "${URL}")

# Processing data
WEATHER_CONDITION=$(echo "$WEATHER_JSON" | jq '.weather[0].main' | sed 's/"//g')
WEATHER_DESCRIPTION=$(echo "$WEATHER_JSON" | jq '.weather[0].description' | sed 's/"//g')
WEATHER_DESCRIPTION=${WEATHER_DESCRIPTION^}
CUR_TEMP=$(awk "BEGIN {printf \"%.0f\", $(echo "$WEATHER_JSON" | jq '.main.temp')}")
MIN_TEMP=$(awk "BEGIN {printf \"%.0f\", $(echo "$WEATHER_JSON" | jq '.main.temp_min')}")
MAX_TEMP=$(awk "BEGIN {printf \"%.0f\", $(echo "$WEATHER_JSON" | jq '.main.temp_max')}")
WIND_SPEED=$(awk "BEGIN {printf \"%.1f\", $(echo "$WEATHER_JSON" | jq '.wind.speed')}")
HUMIDITY=$(echo "$WEATHER_JSON" | jq '.main.humidity' | sed 's/"//g')
CITY=$(echo "$WEATHER_JSON" | jq '.name' | sed 's/"//g')

case "$WEATHER_CONDITION" in
'Thunderstorm')
	WEATHER_ICON=""
	;;
'Rain')
	WEATHER_ICON=""
	;;
'Drizzle')
	WEATHER_ICON=""
	;;
'Snow')
	WEATHER_ICON=""
	;;
'Clouds')
	WEATHER_ICON=""
	;;
'Clear')
	WEATHER_ICON=""
	;;
'Mist' | 'Smoke' | 'Haze' | 'Dust' | 'Fog' | 'Sand' | 'Ash' | 'Squall' | 'Tornado')
	WEATHER_ICON=""
	;;
*)
	WEATHER_ICON=""
	;;
esac

# Output
if [ -n "$CUR_TEMP" ]; then
	echo -e "{\"text\":\"$WEATHER_ICON <span font-family='FiraCode Nerd Font'>$CUR_TEMP°C</span>\",\"tooltip\":\"$WEATHER_ICON <span font-family='FiraCode Nerd Font'>$WEATHER_DESCRIPTION</span>\r <span font-family='FiraCode Nerd Font'>$CITY</span>\r <span font-family='FiraCode Nerd Font'>$WIND_SPEED m/s</span>\r <span font-family='FiraCode Nerd Font'>$MIN_TEMP°C</span>\r <span font-family='FiraCode Nerd Font'>$MAX_TEMP°C</span>\r  <span font-family='FiraCode Nerd Font'>$HUMIDITY%</span>\"}"
else
	echo -e "{\"text\":\" <span font-family='FiraCode Nerd Font'>Weather</span>\", \"tooltip\":\"<span font-family='FiraCode Nerd Font'>Error: Open Weather API</span>\"}"
fi

# Sunset sunrise output
cacheclock=clock.json

if [ ! -f "$cachedir/$cacheclock" ]; then
	touch "$cachedir/$cacheclock"
fi

cacheclockage=$(($(date +%s) - $(stat -c '%Y' "$cachedir/$cacheclock")))
if [ "$cacheclockage" -gt 3600 ] || [ ! -s "$cachedir/$cacheclock" ]; then
	SUNRISE=$(echo "$WEATHER_JSON" | jq '.sys.sunrise')
	SUNSET=$(echo "$WEATHER_JSON" | jq '.sys.sunset')
	echo -e "{\"sunrise\":$SUNRISE, \"sunset\":$SUNSET}" >"$cachedir/$cacheclock"
fi

exit 0
