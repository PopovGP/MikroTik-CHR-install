# MikroTik Cloud Hosted Router install script
Script for installing MikroTik CHR on any VPS

download mikrotik-chr.sh

```
curl -O https://raw.githubusercontent.com/PopovGP/MikroTik-CHR-install/refs/heads/main/mikrotik-chr.sh
```
or
```
wget https://raw.githubusercontent.com/PopovGP/MikroTik-CHR-install/refs/heads/main/mikrotik-chr.sh
```

execute
```
chmod +x mikrotik-chr.sh
```
run script
```
./mikrotik-chr.sh
```

or your copy and paste code below:
```
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
dd if=chr-7.18.1.img of=/dev/vda bs=4M oflag=sync

#
# two lines below this comment are required
# documentation: https://www.kernel.org/doc/html/v5.1/admin-guide/sysrq.html
# enable sysrq

echo 1 > /proc/sys/kernel/sysrq

#  send command to sysrq
# command 'b' - will immediately reboot the system without syncing or unmounting your disks.

echo b > /proc/sysrq-trigger
```
