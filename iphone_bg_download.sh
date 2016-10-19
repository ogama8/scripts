#!/bin/bash

cd ~/pictures/iphone_bg

for i in $(seq -f "%03g" 0 100)
do
   clear
   echo unsplash_$i.jpg
   wget -O unsplash_$i.jpg https://source.unsplash.com/random/744x1392
done

