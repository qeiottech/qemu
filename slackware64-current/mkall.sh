#!/bin/bash
# URL: https://qemu.weilnetz.de/doc/qemu-doc.html
../qemu/build/qemu-img create slackware64-current.img 50G

# for install with ISO
# qemu-system-x86_64 -m 2048 -hda slackware64-current.img -cdrom /home/jaloo/src/slackware64-current.iso -boot once=d
qemu-system-x86_64 -m 2048 -drive file=slackware64-current.img,index=0,media=disk,format=raw -drive file=/home/jaloo/src/slackware64-current.iso,index=1,media=cdrom -boot once=d

# run slackware
# qemu-system-x86_64 -m 2048 -hda slackware64-current.img 
qemu-system-x86_64 -m 2048 -drive file=slackware64-current.img,index=0,media=disk,format=raw

# PXE
# 1. tftpserver
# URL: https://karellen.blogspot.com/2014/04/setting-up-tftp-server-with-slackware.html
# vi /etc/inetd.conf
# sh /etc/rc.d/rc.inetd restart

# 2. PXE
# URL: /tftpboot/slackware64-current/pxelinux.cfg/default
# add console=ttyS0,115200 >> generic.s's append

# 3. NFS
# URL: https://wiki.qemu.org/Documentation/Networking
# server ip address: 10.0.2.2
# nfs path: /nfs_share/slackware64-current/slackware64/

# URL: slackware64-current/usb-and-pxe-installers/README_PXE.TXT
../qemu/build/qemu-system-x86_64 -enable-kvm -cpu host -m 2048 -drive file=./slackware64-current.img,index=0,media=disk,format=raw -nic user,tftp=/tftpboot/slackware64-current,bootfile=/pxelinux.0 -nographic
