#!/bin/bash

config_path="/home/sam/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c "${config_path}/top.ini" top &
    MONITOR=$m polybar -c "${config_path}/bottom.ini" bottom &
  done
else
    MONITOR=$m polybar -c "${config_path}/top.ini" top &
    MONITOR=$m polybar -c "${config_path}/bottom.ini" bottom &
fi
