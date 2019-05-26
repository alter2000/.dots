#!/usr/bin/env sh

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.2; done

[ -n "$1" ] && bar="$1" || bar="i3bar1"
# honestly idk why i stole this
# [[ $(pgrep i3) -gt 0 ]] && export PB_WM_RESTACK=i3

CONMON=$(command -v xrandr && xrandr || exit 1 | grep ' connected ' | head -n 1 | cut -d' ' -f1)

# Launch bars
MONITOR=${CONMON-"eDP-1"} polybar "$bar" -c ~/.dots/polybar/config \
    >/tmp/polybar.log 2>&1 &

echo "Bars launched..."
