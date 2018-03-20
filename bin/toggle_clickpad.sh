#!/bin/bash

state=`synclient -l | grep 'TouchpadOff' | awk '{print $3}'`

if [ $state == '1' ];then
	synclient TouchpadOff=0
	notify-send --urgency=low "pad enabled"  "gg scrub"
else
	synclient TouchpadOff=1
	notify-send --urgency=low "pad disabled" "rub meh"
fi
