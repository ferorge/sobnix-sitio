#!/usr/bin/python3

print('Content-type: text/html\n\n')
import os

os.system("/usr/games/fortune  /usr/share/games/fortunes/es/rms2 | /usr/bin/fold -s >  ../es/68-motd.md")
os.system("/usr/bin/sed -i s/$/'  '/ ../es/68-motd.md")
oos.system("/usr/bin/bash -c 'cd .. && ./620.Creacion-sitio.sh'")
with open("./Sobnix.html") as f:
    print(f.read())
