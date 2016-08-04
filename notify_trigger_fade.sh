#!/bin/bash

COLORS=('bbbbbb' '99bb99' '77bb77' '55bb55' '33bb33' '11bb11')

(echo 'Change Background?') | dzen2 -bg '#222222' -fg '#bbbbbb' -x 850 -y 905 -w 220 -h 26 -p 6 -fn '-*-terminess powerline-medium-r-normal--*-*-*-*-*-*-*-1' &
sleep 1

dzen2 -bg '#222222' -fg '#bbbbbb' -x 850 -y 940 -w 220 -h 36 -p 5 &
sleep 0.01      # weird stuff to make sure this window doesn't get drawn over the indicator

(for i in $(seq 1 5)
do
   A=${A}'^bg(#'${COLORS[$((i-1))]}')^fg(#222222)^fg(#000000) '$i' ^fg(#'${COLORS[$((i-1))]}')^bg(#222222)^bg(#bbbbbb)^fg(#222222)'
   echo $A
   sleep 0.998  # again, super weird
done) | dzen2 -bg '#222222' -fg '#bbbbbb' -x 860 -y 950 -w 200 -h 16 -fn '-*-terminess powerline-medium-r-normal--*-*-*-*-*-*-*-1' -ta l
