#!/bin/bash

function panic(){
   while true
   do
      printf $(date -u --date @$((86400 - (`date +%s` + 3600*$1)%86400)) +%H:%M:%S | tr -d '\n')
      printf ".%03d\n" $((999 - 10#`date +%03N`))        # the 10# forces the result to be in
                                                         # base 10, which would otherwise be
                                                         # interpreted as octal
   done
}

panic -4 | dzen2 -bg darkred -fg grey80 -fn fixed -x 60 -y 390 -w 1800 -h 300 -fn '-*-DejaVu Sans-*-r-*-*-220-*-*-*-*-*-*-*'

