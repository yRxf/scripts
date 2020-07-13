#!/bin/bash
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
export IDENTIFIER="unicode"
. "$DIR/dwmbar-functions/dwm_alsa.sh"
/usr/bin/amixer -qM set Master 2%- umute
xsetroot -name "$(dwm_alsa true)"
#pactl set-sink-volume @DEFAULT_SINK@ -5%
#bash ~/scripts/dwm-status-refresh.sh
