#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_alsa () {
	VOL=$(amixer get Master | tail -n1 | grep -Eo "\[.*\]" | sed -r "s/([][%])//g")
	VOL=(${VOL})
    #VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "${VOL[0]}" -eq 0 ] || [ "${VOL[2]}" == 'off' ]; then
            printf "🔇"
        elif [ "${VOL[0]}" -gt 0 ] && [ "${VOL[0]}" -le 33 ]; then
            printf "🔈"
        elif [ "${VOL[0]}" -gt 33 ] && [ "${VOL[0]}" -le 66 ]; then
            printf "🔉"
        else
            printf "🔊"
        fi
    else
        if [ "${VOL[0]}" -eq 0 ] || [ "${VOL[2]}" == 'off' ]; then
            printf "MUTE %s%%" "${VOL[0]}"
        elif [ "${VOL[0]}" -gt 0 ] && [ "${VOL[0]}" -le 33 ]; then
            printf "VOL"
        elif [ "${VOL[0]}" -gt 33 ] && [ "${VOL[0]}" -le 66 ]; then
            printf "VOL"
        else
            printf "VOL"
        fi
    fi
    if [ "$1" = true ];then
	    printf " %s%%" "${VOL[0]}"
    fi
    printf "%s\n" "$SEP2"
}

