#!/bin/bash

rectangles=" "

SR=$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')
for RES in $SR; do
  SRA=(${RES//[x+]/ })
  CX=$((${SRA[2]} + 25))
  CY=$((${SRA[1]} - 80))
  rectangles+="rectangle $CX,$CY $((CX+300)),$((CY-80)) "
done

TMPBG=/tmp/screen.png
scrot $TMPBG && convert $TMPBG -scale 5% -scale 2000%  $TMPBG

i3lock \
  -i $TMPBG \
  --timepos="x+w/2:y+h-90" \
  --datepos="tx+24:ty+25" \
  --clock --datestr "Oi cunt" \
  --insidecolor=00000000 --ringcolor=f2e6d1ff --line-uses-inside \
  --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 \
  --insidevercolor=fecf4dff --insidewrongcolor=ffffffff \
  --ringvercolor=f2e6d1ff --ringwrongcolor=d23c3dff \
  --radius=20 --veriftext="" --wrongtext="" \
  --timecolor="8ab93fff" --datecolor="821f5aff"

sleep 1
xset dpms force off
rm /tmp/screen.png

# --indpos="x+290:h-120" --ring-width=3


