#!/bin/bash

case $1 in
   "stop")
       cmd="Stop"
       ;;
   "play")
       cmd="PlayPause"
       ;;
   "next")
       cmd="Next"
       ;;
   "prev")
       cmd="Previous"
       ;;
   *)
       echo "Usage: $0 stop|play|next|prev"
       exit 1
        ;;
esac

dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.${cmd}

exit 0
