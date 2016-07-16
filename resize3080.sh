#!/bin/bash

EXT="${1##*.}"
NAME="${1%.*}"

mv $1 "${NAME}_o.${EXT}"

convert "${NAME}_o.${EXT}" -resize 3080x3080 $1
convert $1 -gravity Center -crop 3080x1920+0+0 +repage $1
