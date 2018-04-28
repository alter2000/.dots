#!/bin/bash
# from https://github.com/uriel1998/yolo-mpd/
########################################################################
# This script is designed as a wrapper for mp3gain that handles errors
# gracefully, as well as automates the encoding of the replaygain info
# into the id3 tags from APE
########################################################################


if [ "$1" == "" ]; then
	startdir="$PWD"
	else
		if [ -d "$1" ]; then
			startdir="$1"
		else
			echo "Not a valid directory; exiting."
			exit 1
		fi
fi


# find is not used here so that both operations can be done and so that
# the whole operation doesn't die if mp3gain throws an error ungracefully

IFS=$'\n'

for f in $(find "$startdir" -name '*.mp3' );do
	mp3gain -c -a "$f"
	mp3gain -c -r "$f"
done

unset IFS

find . -type f -iname '*.mp3' -exec ape2id3.py -df {} \;
