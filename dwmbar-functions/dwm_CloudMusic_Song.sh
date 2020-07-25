#!/bin/sh

# get netease-cloud-music song

dwm_CloudMusic_Song () {
  if [ $(ps -ef | grep -c netease-cloud-music) -gt 1 ]; then
    Song=$(awk -F '"track":{' '{print $2}' ~/.cache/netease-cloud-music/StorageCache/webdata/file/history)
    Songname=$(echo $Song | awk -F , '{print $1}' | sed s/\"//g | awk -F : '{print $2}')
    Songer=$(echo $Song | awk -F '"artists":' '{print $2}' | awk -F '}]' '{print $1}' | sed s/\"//g | awk -F 'name:' '{i=2;while (i<=NF) {print $i; i++}}' | awk -F , '{print $1}' | tr "\n" "\/" |sed -e 's/\/$/\n/')
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
      printf "🎵 %s" "$Songname-$Songer"
    else
      printf "Music: %s" "$Songname-$Songer"
    fi
    printf "%s\n" "$SEP2"
  fi
}
