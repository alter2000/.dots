#!/bin/sh

# configurables
barheight=24
separator="|"
# font1="-*-profont-medium-*-*-*-12-*-*-*-*-*-*-*"
# font2="-wuncon-siji-medium-r-normal-*-*-*-*-*-*-*-*-*"
fg="#a23"
bg="#000000"

set -f

# don't forget padding from i3
bargeometry="1920x$barheight+0+0"

python ./topbar.py \
    | lemonbar -u 2 -d -p \
        -g $bargeometry \
        -F $fg -B $bg
        # -f $font1 -f $font2 \
