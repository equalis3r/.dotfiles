#!/bin/sh
if ibus engine | grep "Bamboo" >/dev/null; then
    ibus engine xkb:us::eng
else
    ibus engine Bamboo
fi
