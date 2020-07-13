#!/usr/bin/env bash
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
export IDENTIFIER="unicode"
. "$DIR/dwmbar-functions/dwm_backlight.sh"
xbacklight -inc +2
xsetroot -name "$(dwm_backlight true)"
