#!/usr/bin/env bash

export id=$(xinput list --short | grep '[Ss]ynaptic' | cut -f2 | cut -d= -f2)
export state=$(xinput list-props $id | grep 'Device Enabled' | cut -f3)

if [[ $state == '0' ]];then
	echo "$id ----- $state"
	xinput enable $id
	notify-send --urgency=low "pad enabled"  "gg scrub"
else
	echo "$id ----- $state"
	xinput disable $id
	notify-send --urgency=low "pad disabled" "rub meh"
fi
