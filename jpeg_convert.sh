#!/bin/bash

for f in *.tif
   do
   echo "$f"
   convert "$f" "$(basename "$f" .tif).jpg"
done

mkdir JPEG
mv *.jpg JPEG/
