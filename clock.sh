#!/bin/bash

(while true; do date +%T.%3N; sleep 0.0005715; done) | dzen2 -bg darkred -fg grey80 -fn fixed -x 60 -y 390 -w 1800 -h 300 -fn '-*-DejaVu Sans-*-r-*-*-220-*-*-*-*-*-*-*'

