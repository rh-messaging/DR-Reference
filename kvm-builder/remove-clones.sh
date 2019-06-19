#!/bin/bash

# After the first image is created and configured, this script will clone N copies to be used

cd disks

zeroos="00"
for i in {3..11}
do
	zeronr=${zeroos:${#i}:${#zeroos}}${i}
	echo $zeronr
	yes | rm ceph${zeronr}.qcow2
done

yes | rm *osd.img
