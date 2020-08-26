#!/run/current-system/sw/bin/sh

killall -q polybar

polybar mybar 2>&1 &

