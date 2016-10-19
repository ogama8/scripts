#!/bin/bash

function countdown(){
   m=$1
   s=$2
   ns=0

   printf "00:%02d:%02d.%03d\n" $m $s $ns
   sleep 1

   while [ $m -gt 0 ] || [ $s -gt 0 ] || [ $ns -gt 0 ]
   do
      printf "00:%02d:%02d.%03d\n" $m $s $ns
      ((ns--))
      if [ $ns -lt 0 ]
      then
         ns=999
         ((s--))
         if [ $s -lt 0 ]
         then
            s=59
            ((m--))
         fi
      fi
      sleep 0.0005715
   done

   printf "00:%02d:%02d.%03d\n" $m $s $ns
   sleep 600
}

(countdown 20 0) | dzen2 -bg darkred -fg grey80 -fn fixed -x 60 -y 390 -w 1800 -h 300 -fn '-*-DejaVu Sans-*-r-*-*-220-*-*-*-*-*-*-*'
