#!/bin/bash

cd ~/pictures/backgrounds/temp

NEW=$(find ../ -maxdepth 1 -type f ! -name '*_o*')
NEW=$(shuf -n1 -e $NEW)
cp $NEW ./_new.jpg

for i in $(seq -f "%03g" 0 500)
do
   composite -displace $i _new.jpg _cur.jpg fade$i.jpg
   if [ $i -gt 250 ]
   then
      ADJ=$(echo "$i - 250" | bc)
      composite -dissolve $(echo "$ADJ / 2.5" | bc) _new.jpg fade$i.jpg fade$i.jpg
   fi
done

mv _new.jpg _cur.jpg


for i in $(seq -f "%03g" 0 500)
do
   feh --bg-fill fade$i.jpg
done

rm fade*.jpg

