#!/bin/bash

if sh ~/scripts/cur_fade.sh > /dev/null
then
   (echo 'Fade not ready.') | dzen2 -bg '#222222' -fg '#bbbbbb' -x 850 -y 905 -w 220 -h 26 -p 3 -fn '-*-terminess powerline-medium-r-normal--*-*-*-*-*-*-*-1' &
   rm /tmp/trigger_fade
   exit 1
fi

sh ~/scripts/notify_trigger_fade.sh &

for i in $(seq 0 60)
do
   if [ ! -f /tmp/trigger_fade ]
   then
      killall dzen2
      exit 1
   fi
   sleep 0.1
done

rm /tmp/trigger_fade

sh ~/scripts/fade_bg_parallel.sh &

