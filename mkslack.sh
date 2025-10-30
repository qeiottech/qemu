#!/bin/bash
cd qemu
./configure --enable-debug --enable-slirp 2>&1 | tee configure.log
make V=1 -j$(nproc) 2>&1 | tee make.log
