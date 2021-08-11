#!/bin/sh

maim --select --format=png --hidecursor --bordersize=2 \
    | tee ~/var/scrots/$(date +%s).png \
    | xclip -selection clipboard -t image/png

# add a shadow, then save to FILE
# convert - \( +clone -background black -shadow 80x3+5+5 \) +swap -background none -layers merge +repage FILE
