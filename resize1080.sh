#!/bin/bash

EXT="${1##*.}"
NAME="${1%.*}"

mv $1 "${NAME}_o.${EXT}"

convert "${NAME}_o.${EXT}" -resize 1920x1920 $1
convert $1 -gravity Center -crop 1920x1080+0+0 +repage $1
