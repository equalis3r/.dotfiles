#!/bin/sh
if ibus engine | grep "Bamboo" >/dev/null; then
	echo "VN"
else
	echo "EN"
fi
