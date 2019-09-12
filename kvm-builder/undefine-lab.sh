#!/bin/bash

#this can be used to start the whole lab 

sudo virsh undefine ceph_ansible
sudo virsh undefine client1
sudo virsh undefine client2
sudo virsh undefine client3
sudo virsh undefine DC1
sudo virsh undefine DC1_OSD1
sudo virsh undefine DC1_OSD2
sudo virsh undefine DC1_OSD3
sudo virsh undefine DC2
sudo virsh undefine DC2_OSD1
sudo virsh undefine DC2_OSD2
sudo virsh undefine DC2_OSD3
sudo virsh undefine DC3
