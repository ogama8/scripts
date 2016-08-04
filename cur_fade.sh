#!/bin/bash

cd ~/pictures/backgrounds/temp/

if [ ! -f fade1000.jpg ]
then
   echo -n '<span foreground="#222222" background="#bbbbbb">'
   echo -n $(ls | grep '[2-9]' | sort -r | head -n 1 | tr -d -c [0-9])
   echo '▐</span>'
   exit 0
elif [ ! -f _right/fade1000.jpg ]
then
   echo -n '<span foreground="#a0c060"></span><span foreground="#222222" background="#a0c060">'
   echo -n $(ls _right/ | grep '[1-9]' | sort -r | head -n 1 | tr -d -c [0-9])
   echo '▐</span>'
   exit 0
else
   exit 1
fi

