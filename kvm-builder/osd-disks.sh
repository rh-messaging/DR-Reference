#!/bin/bash

# After the first image is created and configured, this script will clone N copies to be used

cd disks

zeroos="00"
for i in {6..11}
do
	zeronr=${zeroos:${#i}:${#zeroos}}${i}
	echo attaching OSD disk on ceph${zeronr}
	dd if=/dev/zero of=ceph${zeronr}-osd.img bs=1M count=2048
	sudo virsh attach-disk ceph${zeronr} `pwd`/ceph${zeronr}-osd.img vdb --cache none --persistent
done
