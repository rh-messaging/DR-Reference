#!/bin/bash

#this can be used to start the whole lab 

sudo virsh start ceph_ansible
sudo virsh start client1
sudo virsh start client2
sudo virsh start client3
sudo virsh start DC1
sudo virsh start DC1_OSD1
sudo virsh start DC1_OSD2
sudo virsh start DC1_OSD3
sudo virsh start DC2
sudo virsh start DC2_OSD1
sudo virsh start DC2_OSD2
sudo virsh start DC2_OSD3
sudo virsh start DC3

