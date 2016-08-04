#!/bin/bash

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

