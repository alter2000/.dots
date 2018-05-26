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

xrdb -load "$HOME/.Xresources"

# case $DESKTOP_SESSION in
#   i3)
#     $HOME/.dots/polybar/launch.sh i3bar1 &
#     # $HOME/.dots/polybar/launch.sh i3bar2 &
#     ;;
#   *)
#     $HOME/.dots/polybar/launch.sh bspbar &
#     exec bspwm
#     ;;
# esac
exec i3
