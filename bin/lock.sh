#!/usr/bin/env bash
# needs i3lock-color

rectangles=" "

TMPBG=/tmp/screen.png
maim $TMPBG && convert $TMPBG -scale 5% -scale 2000% $TMPBG
# TMPBG="$HOME/git/me/img/loop-lock.png"

pkill -u $USER -USR1 dunst

[ `command -v i3lock-color` ] >/dev/null 2>&1 && I3L="i3lock-color" || I3L="i3lock"

$I3L \
	-i $TMPBG \
	--ind-pos="x+w/2:y+h/2"      \
	--date-pos="tx+24:ty+25"     \
	--time-pos="x+w/2:y+h-90"    \
	--ring-width=13              \
	--clock                      \
	--date-str "Oi cunt"         \
	--inside-color=00000000      \
	--ring-color=f2e6d1ff        \
	--line-uses-inside           \
	--keyhl-color=d23c3dff       \
	--bshl-color=d23c3dff        \
	--separator-color=00000000   \
	--insidever-color=fecf4dff   \
	--insidewrong-color=ffffffff \
	--ringver-color=f2e6d1ff     \
	--ringwrong-color=d23c3dff   \
	--radius=30                  \
	--time-color="8ab93fff"      \
	--date-color="821f5aff"      \
	--verif-text=""              \
	--wrong-text=""

pkill -u $USER -USR2 dunst

# xset dpms force off
