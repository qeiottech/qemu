#!/bin/bash
cd qemu
./configure --enable-debug --enable-slirp 2>&1 | tee configure.log
# make V=1 -j$(nproc) 
make V=1 2>&1 | tee make.log
make ctags
make cscope

# roms
./build/qemu-system-x86_64 -d trace:pci_rom_and_pci_ids
# pci_rom_and_pci_ids vgabios-stdvga.bin: ROM ID 1234:1111 | PCI ID 1234:1111
# pci_rom_and_pci_ids efi-e1000.rom: ROM ID 8086:100e | PCI ID 8086:100e
(qemu) info roms
# fw=genroms/kvmvapic.bin size=0x002400 name="kvmvapic.bin"
# addr=00000000fffc0000 size=0x040000 mem=rom name="bios-256k.bin"
# /rom@etc/acpi/tables size=0x200000 name="etc/acpi/tables"
# /rom@etc/table-loader size=0x010000 name="etc/table-loader"
# /rom@etc/acpi/rsdp size=0x001000 name="etc/acpi/rsdp"

# submodules
# git submodule update --init --recursive
# seabios
git submodule update --init roms/seabios
cd roms
make bios
# make bios 2> /dev/null | grep -w "cp"
# cp config.seabios-128k seabios/builds/seabios-128k/.config
# cp config.seabios-256k seabios/builds/seabios-256k/.config
# cp config.seabios-microvm seabios/builds/seabios-microvm/.config
# cp seabios/builds/seabios-128k/bios.bin ../pc-bios/bios.bin
# cp seabios/builds/seabios-256k/bios.bin ../pc-bios/bios-256k.bin
# cp seabios/builds/seabios-microvm/bios.bin ../pc-bios/bios-microvm.bin
make vgabios
# make vgabios 2> /dev/null | grep -w "cp"
# cp config.vga-stdvga seabios/builds/vga-stdvga/.config
# cp seabios/builds/vga-stdvga/vgabios.bin ../pc-bios/vgabios-stdvga.bin
# cp config.vga-cirrus seabios/builds/vga-cirrus/.config
# cp seabios/builds/vga-cirrus/vgabios.bin ../pc-bios/vgabios-cirrus.bin
# cp config.vga-vmware seabios/builds/vga-vmware/.config
# cp seabios/builds/vga-vmware/vgabios.bin ../pc-bios/vgabios-vmware.bin
# cp config.vga-qxl seabios/builds/vga-qxl/.config
# cp seabios/builds/vga-qxl/vgabios.bin ../pc-bios/vgabios-qxl.bin
# cp config.vga-isavga seabios/builds/vga-isavga/.config
# cp seabios/builds/vga-isavga/vgabios.bin ../pc-bios/vgabios.bin
# cp config.vga-virtio seabios/builds/vga-virtio/.config
# cp seabios/builds/vga-virtio/vgabios.bin ../pc-bios/vgabios-virtio.bin
# cp config.vga-bochs-display seabios/builds/vga-bochs-display/.config
# cp seabios/builds/vga-bochs-display/vgabios.bin ../pc-bios/vgabios-bochs-display.bin
# cp config.vga-ramfb seabios/builds/vga-ramfb/.config
# cp seabios/builds/vga-ramfb/vgabios.bin ../pc-bios/vgabios-ramfb.bin
# cp config.vga-ati seabios/builds/vga-ati/.config
# cp seabios/builds/vga-ati/vgabios.bin ../pc-bios/vgabios-ati.bin

# ipxe
git submodule update --init roms/ipxe
# cd roms/ipxe/
# git checkout master
# cd -
# ./scripts/refresh-pxe-roms.sh
cd roms
make pxerom
# cp ipxe/src/bin/8086100e.rom ../pc-bios/pxe-e1000.rom
# cp ipxe/src/bin/808610d3.rom ../pc-bios/pxe-e1000e.rom
# cp ipxe/src/bin/80861209.rom ../pc-bios/pxe-eepro100.rom
# cp ipxe/src/bin/10500940.rom ../pc-bios/pxe-ne2k_pci.rom
# cp ipxe/src/bin/10222000.rom ../pc-bios/pxe-pcnet.rom
# cp ipxe/src/bin/10ec8139.rom ../pc-bios/pxe-rtl8139.rom
# cp ipxe/src/bin/1af41000.rom ../pc-bios/pxe-virtio.rom
# cp ipxe/src/bin/15ad07b0.rom ../pc-bios/pxe-vmxnet3.rom
