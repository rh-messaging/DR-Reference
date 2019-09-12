#!/bin/bash

#this can be used to stop the whole lab

sudo virsh shutdown ceph_ansible
sudo virsh shutdown client1
sudo virsh shutdown client2
sudo virsh shutdown client3
sudo virsh shutdown DC1
sudo virsh shutdown DC1_OSD1
sudo virsh shutdown DC1_OSD2
sudo virsh shutdown DC1_OSD3
sudo virsh shutdown DC2
sudo virsh shutdown DC2_OSD1
sudo virsh shutdown DC2_OSD2
sudo virsh shutdown DC2_OSD3
sudo virsh shutdown DC3

