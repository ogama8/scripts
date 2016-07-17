#!/bin/bash

EXT="${1##*.}"
NAME="${1%.*}"

convert $1 -crop 1920x1080+0000+0480 +repage "${NAME}_l.${EXT}"
convert $1 -crop 1080x1920+2000+0000 +repage "${NAME}_r.${EXT}"

