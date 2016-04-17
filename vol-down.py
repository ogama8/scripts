import os
import sys
import time
import random

steps    = 50
size     = "65" # 100% is at 65536
delay    = 0.01
lockfile = "/tmp/volume-down-lock"


while (os.path.exists(lockfile)):
    time.sleep(random.random())     # Lowers the chance of two whiles ending at
                                    # the exact same time

f = open(lockfile, 'w')
f.close()

for i in range(0, steps):
    os.system("pactl set-sink-volume 1 -" + size)
    time.sleep(delay)

os.remove(lockfile)

