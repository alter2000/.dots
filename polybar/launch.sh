#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if $(pgrep i3) -gt 0; then
	export PB_WM_RESTACK=i3
fi
if $(pgrep bspwm) -gt 0; then
	export PB_WM_RESTACK=bspwm
fi

# Launch bars
polybar $1 -c ~/.dots/polybar/config &

echo "Bars launched..."
