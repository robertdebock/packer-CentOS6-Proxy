#!/bin/sh

echo "Running $0 ($(date))"

echo "Installing epel-release."
yum -y install epel-release

echo "Installing dkms and bzip2"
yum -y install dkms bzip2

echo "Installing kernel-devel"
yum -y install kernel-devel-$(uname -r)

echo "Installing group Development Tools."
yum -y groupinstall 'Development Tools'

echo "Mounting Virtual Box additional guest tools."
mount /dev/sr1 /mnt

echo "Installing Virtual Box additional guest tools."
/mnt/VBoxLinuxAdditions.run

echo "Unmounting Virtual Box additional guest tools."
umount /mnt

echo "Done running $0 ($(date))"
