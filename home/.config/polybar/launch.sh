#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar-example.log

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload example &
	done
else
	polybar --reload example &
	# polybar example 2>&1 | tee -a /tmp/polybar-example.log & disown
fi

echo "Bars launched..."
