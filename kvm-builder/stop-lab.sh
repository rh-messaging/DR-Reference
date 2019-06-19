#!/bin/bash

#this can be used to start the whole lab 

zeroos="00"
for i in {2..12}
do
	zeronr=${zeroos:${#i}:${#zeroos}}${i}
	sudo virsh destroy ceph${zeronr}
done
