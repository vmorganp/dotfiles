#!/usr/bin/env sh
# shamelessly yoinked from
# https://www.reddit.com/r/i3wm/comments/6lo0z0/how_to_use_polybar/

# Terminate already running bar instances
killall -9 polybar
pkill polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

MONITOR=DP-0 polybar --reload base &
# Real cool stuff to run polybar on every monitor which is not what I want
# # Launch polybar
# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload base &
#   done
# else
#   polybar --reload base &
# fi
