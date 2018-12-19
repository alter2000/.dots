#!/bin/sh

barheight=24
separator="|"
font1=""
font2=""
my_fg="#70655B"
my_bg="#F2E6D1"

set -f

DIR=~/.dots/scripts/lemonbar
monitor=0
mgeom=( $(herbstclient monitor_rect "$monitor") )
offset=$(herbstclient get frame_gap)
bargeometry="${mgeom[2]}x$barheight+0+0"

herbstclient pad $monitor $(expr $barheight)

python $DIR/topbar.py \
    | lemonbar -u 2 -d -p \
        -g $bargeometry \
        -f $font1 -f $font2 \
        -F $my_fg -B $my_bg
