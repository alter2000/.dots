#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
    done
  unset f
fi

synclient TapButton1=1
synclient TapButton2=2
synclient HorizTwoFingerScroll=1
synclient VertTwoFingerScroll=1
keynav &
setxkbmap -option caps:ctrl_modifier

xrdb -load "${HOME}/.Xresources"

# exec i3
# exec bspwm
