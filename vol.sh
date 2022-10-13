#!/bin/sh

PERC="$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master) | sed -n 's/%//gp')"
ICON=""

if [ "$PERC" -ge 0 ] && [ "$PERC" -le 10 ]; then
	ICON="奄"
elif [ "$PERC" -gt 10 ] && [ "$PERC" -le 60 ]; then
	ICON="奔"
elif [ "$PERC" -gt 60 ] && [ "$PERC" -le 100 ]; then
	ICON="墳"
fi

ISMUTE="$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $6 }')"

if [ $ISMUTE = 'off' ]; then
	ICON="ﱝ "
fi

echo ^c#ff9e64^$ICON ^c#a9b1d6^$PERC%
