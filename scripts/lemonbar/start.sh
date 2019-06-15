#!/bin/sh

# configurables
barheight=24
x=0
y=0
separator="|"
# font1="-*-profont-medium-*-*-*-12-*-*-*-*-*-*-*"
# font2="-wuncon-siji-medium-r-normal-*-*-*-*-*-*-*-*-*"
font1="Hasklig 8"
fg="#a23"
bg="#000000"

set -f

# don't forget padding from i3
bargeometry="1920x$barheight+$x+$y"

python ./topbar.py \
    | lemonbar -u 2 -d -p \
        -g $bargeometry \
        -f $font1 \
        -F $fg -B $bg
        # -f $font2 \
