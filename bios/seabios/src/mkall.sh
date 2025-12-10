#!/bin/bash
# URL: seabios/README
cd seabios
# make menuconfig
# make -n 2>&1 | tee ../make_n.log
# make -d 2>&1 | tee ../make_d.log
# make -n -d 2>&1 | tee ../make_n_d.log
# make -d V=1 2>&1 | tee ../make_d_V.log
make V=1 2>&1 | tee make_V.log
../../../../qemu/build/qemu-system-x86_64 -bios out/bios.bin
#  ../../../../qemu/build/qemu-system-x86_64 -bios out/bios.bin -d trace:pci_rom_and_pci_ids
# pci_rom_and_pci_ids vgabios-stdvga.bin: ROM ID 1234:1111 | PCI ID 1234:1111
# pci_rom_and_pci_ids efi-e1000.rom: ROM ID 8086:100e | PCI ID 8086:100e

# qemu
cp $QEMU_SOURCE_DIR/roms/config.seabios .config
make olddefconfig
make

qemu-system-x86_64 -nographic -bios pc-bios/bios.bin
