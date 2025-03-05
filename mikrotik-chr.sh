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
curl -O https://download.mikrotik.com/routeros/7.18.1/chr-7.18.1.img.zip
unzip chr-7.18.1.img.zip

echo u > /proc/sysrq-trigger

# documentation: https://www.kernel.org/doc/html/v5.1/admin-guide/sysrq.html
# enable sysrq
echo 1 > /proc/sys/kernel/sysrq

dd if=chr-7.18.1.img of=/dev/vda bs=4M oflag=sync

#  send command to sysrq
# command 'b' - will immediately reboot the system without syncing or unmounting your disks.
echo b > /proc/sysrq-trigger
