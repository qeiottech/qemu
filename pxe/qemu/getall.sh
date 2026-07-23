#!/bin/bash
# URL: https://gist.github.com/extremecoders-re/e8fd8a67a515fee0c873dcafc81d811c#file-qemu-networking-md
sudo qemu-system-x86_64 -enable-kvm -boot n -netdev tap,id=mynet0,ifname=tap0,script=no,downscript=no -device e1000,netdev=mynet0,mac=52:55:00:d1:55:01

# URL: https://www.qemu.org/2018/05/31/nic-parameter/
# URL: https://wiki.qemu.org/Documentation/Networking#The_-nic_option
sudo qemu-system-x86_64 -enable-kvm -boot n -nic tap,script=no,downscript=no

# URL: slackware64-current/usb-and-pxe-installers/README_PXE.TXT
./qemu-system-x86_64 -nic user,tftp=/tftpboot/slackware64-current,bootfile=/pxelinux.0
