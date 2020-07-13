#!/bin/sh

# A dwm_bar module to display the current backlight brighness with xbacklight
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xbacklight

dwm_backlight () {
    light=$(xbacklight)
    light=${light%.*}
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$light" -gt 0 ] && [ "$light" -le 33 ]; then
            printf "🔅" 
        elif [ "$light" -gt 33 ] && [ "$light" -le 66 ]; then
            printf "🔆"
        else
            printf "☀"
        fi
    else
        if [ "$light" -gt 0 ] && [ "$light" -le 33 ]; then
            printf "B_LIG %s" "$light"
        else
            printf "B_LIG %s" "$light"
        fi
    fi
    if [ "$1" = true ];then
	    printf " %s" "$light"
    fi
    printf "%s\n" "$SEP2"
}

#dwm_backlight
