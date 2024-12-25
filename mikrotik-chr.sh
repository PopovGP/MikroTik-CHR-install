#!/usr/bin/env bash
#
# Mikrotik Cloud Hosted Router installation script
# file: mikrotik-chr.sh
#
# Setting up Mikrotik CHR on Debian 12, but works on all Linux machines
#
# must be run as a root
#
apt-get install -y curl unzip
curl -O https://download.mikrotik.com/routeros/7.16.2/chr-7.16.2.img.zip
unzip chr-7.16.2.img.zip
dd if=chr-7.16.2.img of=/dev/vda bs=4M oflag=sync
#
# two lines below this comment are required
# documentation: https://www.kernel.org/doc/html/v5.1/admin-guide/sysrq.html
# enable sysrq
echo 1 > /proc/sys/kernel/sysrq
#  send command to sysrq
# command 'b' - will immediately reboot the system without syncing or unmounting your disks.
echo b > /proc/sysrq-trigger
