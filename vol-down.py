import os
import sys
import time

steps    = 50
size     = "65" # 100% is at 65536
delay    = 0.01
lockfile = "/tmp/volume-down-lock"


if (os.path.exists(lockfile)):
        f = open(lockfile, 'r')
        cycles = int(f.read())
        f.close();

        cycles += 1
        print(cycles)
        f = open(lockfile, 'w')
        f.write(str(cycles))
        f.close

else:
    f = open(lockfile, 'w')
    f.write('1')
    f.close()

    while True:
        for i in range(0, steps):
            os.system("pactl set-sink-volume 1 -" + size)
            time.sleep(delay)

        f = open(lockfile, 'r')
        cycles = int(f.read())
        f.close();

        cycles -= 1
        if(cycles == 0):
            os.remove(lockfile)
            break
        else:
            f = open(lockfile, 'w')
            f.write(str(cycles))
            f.close


