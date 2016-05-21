#!/bin/bash

if [ $# -eq 0 ] || [ $# -gt 1 ]
then
   echo "Saves current background to permanent directory "
   echo " --- usage: sh bg_save.sh [filename]"
   exit 1
fi

cd ~/pictures/backgrounds
mv temp/_cur.jpg ./$1.jpg

echo "Saved as $1.jpg in ~/pictures/backgrounds"

