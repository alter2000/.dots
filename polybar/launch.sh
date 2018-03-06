#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if $(pgrep i3); then
	export PB_WM_RESTACK=i3
fi
if $(pgrep bspwm); then
	export PB_WM_RESTACK=bspwm
fi
if $(pgrep openbox); then
	export PB_WM_RESTACK=openbox
fi

# Launch bars
polybar i3bar1 -c ~/.dots/polybar/config &
#polybar one -c ~/.dots/polybar/solarized-light &
#polybar two -c ~/.dots/polybar/solarized-light &
#polybar three -c ~/.dots/polybar/solarized-light &
#polybar i3bar2 &

echo "Bars launched..."
