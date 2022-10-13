#!/bin/sh

PERC="$(acpi | grep -o '[0-9][0-9]%' | grep -o '[0-9][0-9]')"
ICON=""
STAT="$(acpi | awk '{print $3}')"

icon_discharge(){
	if [ "$PERC" -ge 0 ] && [ "$PERC" -le 15 ]; then
		ICON="^c#f7768e^ "
	elif [ "$PERC" -gt 15 ] && [ "$PERC" -le 40 ]; then
		ICON="^c#e0af68^ "
	elif [ "$PERC" -gt 40 ] && [ "$PERC" -le 70 ]; then
		ICON="^c#e0af68^ "
	elif [ "$PERC" -gt 70 ] && [ "$PERC" -le 95 ]; then
		ICON="^c#9ece6a^ "
	elif [ "$PERC" -gt 95 ] && [ "$PERC" -le 100 ]; then
		ICON="^c#9ece6a^ "
	fi
	echo ^c#2ac3de^$ICON" "^c#a9b1d6^$PERC%

}

icon_charging(){
	case $(($(date +%S) % 5)) in
		0)
		ICON=" "
		;;
		1)
		ICON=" "
		;;
		2)
		ICON=" "
		;;
		3)
		ICON=" "
		;;
		4)
		ICON=" "
		;;
	esac
	echo ^c#2ac3de^$ICON" "^c#a9b1d6^$PERC%
}

case $STAT in
	"Charging,")
	icon_charging
	;;
	*)
	icon_discharge
	;;
esac

