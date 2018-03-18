#!/bin/bash

state=`synclient -l | grep 'TouchpadOff' | awk '{print $3}'`

if [ $state == '1' ];then
	synclient TouchpadOff=0
	notify-send "pad enabled"  "gg scrub"
else
	synclient TouchpadOff=1
	notify-send "pad disabled" "rub meh"
fi
