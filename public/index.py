#!/usr/bin/python3

print('Content-type: text/html\n\n')
import os

os.system("/usr/bin/bash -c 'cd .. && ./620.Creacion-sitio.sh'")
with open("./Sobnix.html") as f:
    print(f.read())
