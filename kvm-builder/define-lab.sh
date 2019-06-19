#!/bin/bash

# After you undefined the lab, this may be useful to redefine the lab for a previously existent qcow2 set of images

cd disks

zeroos="00"
for i in {2..12}
do
	zeronr=${zeroos:${#i}:${#zeroos}}${i}
	echo $zeronr
	sudo virt-install --name ceph${zeronr} --memory 2048 --vcpus 1 --disk ceph${zeronr}.qcow2 --import --os-variant rhel7 --network network=cephlab,mac=52:54:00:c2:ad:${zeronr} --print-xml > ceph${zeronr}.xml
	sudo virsh define ceph${zeronr}.xml
done

for i in {6..10}
do
	zeronr=${zeroos:${#i}:${#zeroos}}${i}
	echo attaching OSD disk on ceph${zeronr}
	sudo virsh attach-disk ceph${zeronr} `pwd`/ceph${zeronr}-osd.img vdb --cache none --persistent
done
