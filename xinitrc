#!/bin/sh

export QT_QPA_PLATFORMTHEME='qt5ct'
export QT_AUTO_SCREEN_SCALE_FACTOR=1.2
test -v XDG_RUNTIME_DIR && export XDG_RUNTIME_DIR=/run/user/$(id -u)
# export GDK_SCALE=2
# export GDK_DPI_SCALE=1.4

keynav &

setxkbmap -option caps:ctrl_modifier

# # PrtSc in Thinkpad is shit
# xmodmap -e 'keycode 0xff61 = Control_R'
# xcape -e 'Print=Control_R'
# xcape -e 'Caps_Lock=Escape'

# /usr/lib/polkit-1-dde/dde-polkit-agent >/dev/null &

# if ! pgrep gpg-agent 1>/dev/null; then
# 	eval `gpg-agent` && echo 'hai -- dis gpg'
# fi

# if ! pgrep ssh-agent 1>/dev/null; then
# 	eval `ssh-agent` && echo 'hai -- dis ssh'
# fi

# sxhkd &

~/.fehbg

~/.dots/polybar/launch.sh xmonadbar

exec i3
