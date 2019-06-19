#!/bin/bash

#this script is to create the first rhel image to be used on the lab

export BASE_IMAGE=rhel-server-7.5-update-1-x86_64-kvm.qcow2

./define-network.sh

mkdir disks
cp $BASE_IMAGE ./disks/ceph02.qcow2
sudo virt-customize -a ./disks/ceph02.qcow2 --root-password password:redhat --uninstall cloud-init
sudo virt-install --name ceph02 --memory 2048 --vcpus 1 --disk ./disks/ceph02.qcow2 --import --os-variant rhel7 --print-xml --network network=cephlab,mac=52:54:00:c2:ad:02 > ./disks/ceph02.xml
sudo virsh define ./disks/ceph02.xml
sudo virsh start ceph02
