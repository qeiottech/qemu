#!/bin/bash
# URL:
cd seabios
cp $QEMU_SOURCE_DIR/roms/config.seabios .config
make olddefconfig
make

qemu-system-x86_64 -nographic -bios pc-bios/bios.bin
