#!/bin/bash ####################################################################

cd ~/pictures/backgrounds/temp

if [ -f fade1000.jpg ]
then
   for i in $(seq -f "%04g" 0 1000)
   do
      feh --bg-fill fade$i.jpg
   done
fi

rm fade*.jpg

NEW=$(find ../ -maxdepth 1 -type f ! -name '*_o*')
NEW=$(shuf -n1 -e $NEW)
cp $NEW ./_new.jpg

for i in $(seq -f "%04g" 0 1000)
do
   composite -displace $(echo "$i / 2" | bc -l) _new.jpg _cur.jpg fade$i.jpg
   if [ $i -gt 500 ]
   then
      ADJ=$(echo "$i - 500" | bc -l)
      composite -dissolve $(echo "$ADJ / 5" | bc -l) \
               _new.jpg fade$i.jpg fade$i.jpg
   fi
done

mv _new.jpg _cur.jpg


