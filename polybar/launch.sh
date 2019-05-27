#!/usr/bin/env sh

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.2; done

[ -n "$1" ] && bar="$1" || bar="i3bar1"
# honestly idk why i stole this
# [[ $(pgrep i3) -gt 0 ]] && export PB_WM_RESTACK=i3

if [ -z "$MONITOR" ]; then
    CONMON=$(command -v xrandr >/dev/null 2>&1 && \
             xrandr | grep ' connected ' | head -n 1 | cut -d' ' -f1)
    MONITOR=${CONMON:-"eDP-1"}
fi

export MONITOR

# Launch bars
polybar "$bar" -c ~/.dots/polybar/config &

echo "Bars launched..."
