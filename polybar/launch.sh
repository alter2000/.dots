#!/usr/bin/env sh

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.2; done

# honestly idk why i stole this
# [[ $(pgrep i3) -gt 0 ]] && export PB_WM_RESTACK=i3

# Launch bars
polybar $1 -c ~/.dots/polybar/config &

echo "Bars launched..."
