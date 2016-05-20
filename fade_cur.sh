#!/bin/bash

cd ~/pictures/backgrounds/temp/

while true
do
echo -ne '\r' $(ls | grep '[0-9]' | sort -r | head -n 1 | tr -d -c [0-9])
done

