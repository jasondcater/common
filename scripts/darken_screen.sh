#!/bin/bash
current_brightness=$(xrandr --verbose | awk '/Brightness/ { print $2; exit }')
current_brightness=$(bc -l <<< "$current_brightness*1.0")
is_lt_gt=$(echo "$current_brightness<=0.0" | bc)

if [ $is_lt_gt -ge 1 ]; then
  xrandr --output eDP-1 --brightness 0.1
else
  next_brightness=$(bc -l <<< "$current_brightness-0.1")
  xrandr --output eDP-1 --brightness $next_brightness
fi

