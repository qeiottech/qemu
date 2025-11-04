#!/bin/bash
# URL: seabios/README
cd seabios
# make menuconfig
# make -d 2>&1 | tee make_d.log
make V=1 2>&1 | tee make_V.log
../../qemu/build/qemu-system-x86_64 -bios out/bios.bin

# qemu
cp $QEMU_SOURCE_DIR/roms/config.seabios .config
make olddefconfig
make

qemu-system-x86_64 -nographic -bios pc-bios/bios.bin
