#!/bin/bash

#this can be used to start the whole lab 

zeroos="00"
for i in {2..13}
do
	zeronr=${zeroos:${#i}:${#zeroos}}${i}
	sudo virsh undefine ceph${zeronr}
done
