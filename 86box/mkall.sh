#!/bin/bash
# URL: README-UNIX-MODE-WITH-OSD.txt
cd 86Box 
mkdir build 
cd build
cmake .. --preset regular -D QT=OFF
cmake --build regular -j 128
cd ../../
ln -s 86Box/build/regular/src/86Box 86Box.run
