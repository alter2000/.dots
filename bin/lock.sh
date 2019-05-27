#!/usr/bin/env bash
# needs i3lock-color

rectangles=" "

# TMPBG=/tmp/screen.png
# scrot $TMPBG && convert $TMPBG -scale 5% -scale 2000% $TMPBG
TMPBG="$HOME/git/me/img/loop-lock.png"

pkill -u $USER -USR1 dunst

[ `command -v i3lock-color` ] >/dev/null 2>&1 && I3L="i3lock-color" || I3L="i3lock"

$I3L \
	-i $TMPBG \
	--timepos="x+w/2:y+h-90"    \
	--datepos="tx+24:ty+25"     \
	--indpos="x+w/2:y+h/2"      \
	--ring-width=13             \
	--clock                     \
	--datestr "Oi cunt"         \
	--insidecolor=00000000      \
	--ringcolor=f2e6d1ff        \
	--line-uses-inside          \
	--keyhlcolor=d23c3dff       \
	--bshlcolor=d23c3dff        \
	--separatorcolor=00000000   \
	--insidevercolor=fecf4dff   \
	--insidewrongcolor=ffffffff \
	--ringvercolor=f2e6d1ff     \
	--ringwrongcolor=d23c3dff   \
	--radius=30                 \
	--timecolor="8ab93fff"      \
	--datecolor="821f5aff"      \
	--veriftext=""              \
	--wrongtext=""

pkill -u $USER -USR2 dunst

# sleep 0.3
# xset dpms force off
# rm /tmp/screen.png
