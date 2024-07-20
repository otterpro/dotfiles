#!/bin/bash
echo "Mounting disk image that has my notes in WSL2"
sudo echo -n
cd /
sudo losetup /dev/loop7 "/home/${USER}/disk.img"
sudo cryptsetup open /dev/loop7 loop7
sudo mount /dev/mapper/loop7 "/home/${USER}/disk"
echo 'Home successfully mounted, now type:'
cd disk/notes

