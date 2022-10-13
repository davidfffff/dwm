#!/bin/sh

STAT="$(ip link show eth0 | awk '{print $9}')"

if [ $STAT = 'UP' ]; then
	echo "^c#73daca^直 "
else
	echo "^c#f7768e^睊 "
fi
