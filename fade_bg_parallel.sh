#!/bin/bash ####################################################################
# Eli Backer - July 2016 - derbacker.us                                        #
## -------------------------------------------------------------------------- ##
# Depends:                                                                     #
#       wget                                                                   #
#       feh                                                                    #
#       gnu parallel                                                           #
##                                                                            ##
# Directories needed:                                                          #
#       ~/pictures/backgrounds                  - saved, recurring backgrounds #
#                  backgrounds/temp             - temp dir for full fades      #
#                              temp/_left       - left crops of fades          #
#                              temp/_right      - right crops of fades         #
##                                                                            ##
# Files needed:                                                                #
#       temp/_cur.jpg                           - current screen image         #
#       temp/_new.jpg                           - image to fade to             #
##                                                                            ##
# Monitor configuration is: 1920x1080 at 0,480; 1080x1920 at 2000x0            #
#       - monitor 2 is placed further left so as to create a slight gap,       #
#         mimicking the physical gap caused by the bezels                      #
################################################################################

export DISPLAY=:0  # Change as needed; ie. "echo $DISPLAY" from a fresh term ###

cd ~/pictures/backgrounds/temp

INDEX=$(ls | grep '[0-9]' | sort -r | head -n 1 | tr -d -c [0-9])

if [ -f _right/fade1000.jpg ]
then
   for i in $(seq -f "%04g" 0 1000)
   do
      feh --bg-fill _left/fade$i.jpg \
                   _right/fade$i.jpg
   done

   mv _new.jpg _cur.jpg
   rm fade*.jpg

   if [ $# -eq 1 ]
   then
      cp $1 ./_new.jpg
   else
      if $(wget -O _new.jpg https://source.unsplash.com/random/3080x1920)
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

seq -f "%04g" $INDEX 1000 | parallel -j7 generate_fades # Limit to 7 proc. #####


generate_crops () {
   convert fade$1.jpg -crop 1920x1080+0000+0480 +repage  _left/fade$1.jpg
   convert fade$1.jpg -crop 1080x1920+2000+0000 +repage _right/fade$1.jpg
}
export -f generate_crops

rm _left/fade*.jpg \
  _right/fade*.jpg

INDEX=0
seq -f "%04g" $INDEX 1000 | parallel -j7 generate_crops # Limit to 7 proc. #####

