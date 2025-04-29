#!/bin/bash

# Terminate already running bar instances
killall -q i3bar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get monitor names
MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)

# Launch a bar for each monitor
for monitor in $MONITORS; do
  # Use the same bar config but pass the monitor name
  MONITOR=$monitor polybar main -c ~/.config/polybar/config.ini &
done