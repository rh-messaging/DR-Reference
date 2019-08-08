#!/bin/bash

# After the first image is created and configured, this script will clone N copies to be used

cd disks

zeroos="00"
for i in {3..13}
do
	zeronr=${zeroos:${#i}:${#zeroos}}${i}
	echo $zeronr
	cp ceph02.qcow2 ceph${zeronr}.qcow2
	sudo virt-install --name ceph${zeronr} --memory 2048 --vcpus 1 --disk ceph${zeronr}.qcow2 --import --os-variant rhel7 --network network=cephlab,mac=52:54:00:c2:ad:${zeronr} --print-xml > ceph${zeronr}.xml
	sudo virsh define ceph${zeronr}.xml
done

cd ..

./osd-disks.sh
