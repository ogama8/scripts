#!/bin/bash ####################################################################

export DISPLAY=:0  # Change as needed; ie. "echo $DISPLAY" from a fresh term ###

cd ~/pictures/backgrounds/temp

INDEX=$(ls | grep '[0-9]' | sort -r | head -n 1 | tr -d -c [0-9])

if [ -f fade1000.jpg ]
then
   for i in $(seq -f "%04g" 0 1000)
   do
      feh --bg-fill fade$i.jpg
   done

   rm fade*.jpg
   mv _new.jpg _cur.jpg

   if [ $# -eq 1 ]
   then
      cp $1 ./_new.jpg
   else
      if $(wget -O _new.jpg https://source.unsplash.com/random/1920x1080)
      then
         if [ $RANDOM -gt $RANDOM ]
         then
            NEW=$(find ../ -maxdepth 1 -type f ! -name '*_o*')
            NEW=$(shuf -n1 -e $NEW)
            cp $NEW ./_new.jpg
         fi
      else
         NEW=$(find ../ -maxdepth 1 -type f ! -name '*_o*')
         NEW=$(shuf -n1 -e $NEW)
         cp $NEW ./_new.jpg
      fi
   fi

   INDEX=0
fi


generate_fades () {
   composite -displace $(echo "$1 / 2" | bc -l) _new.jpg _cur.jpg fade$1.jpg
   if [ $1 -gt 500 ]
   then
      ADJ=$(echo "$1 - 500" | bc -l)
      composite -dissolve $(echo "$ADJ / 5" | bc -l) \
               _new.jpg fade$1.jpg fade$1.jpg &
   fi
}
export -f generate_fades

seq -f "%04g" $INDEX 1000 | parallel -j7 generate_fades # Limit to 3 proc. #####


