#!/bin/bash

# This script is to be executed inside the VM 

ssh-keygen -t rsa
chmod 700 .ssh
cd .ssh
cp id_rsa.pub authorized_keys
chmod 640 authorized_keys

cp ../ssh-config config
chmod 700 config

cd ..




# you may need to attach your subscription, 
# refer to the following as these repos were documented here:
# https://access.redhat.com/documentation/en-us/red_hat_ceph_storage/3/html-single/installation_guide_for_red_hat_enterprise_linux/index

# you will need to find what is your pool, change this
sudo subscription-manager attach --pool=8a85f98460bfb0470160c2facadf3706
sudo subscription-manager repos --disable=*
sudo subscription-manager repos --enable=rhel-7-server-rpms
sudo subscription-manager repos --enable=rhel-7-server-extras-rpms

sudo yum-config-manager --disable epel

sudo subscription-manager repos --enable=rhel-7-server-rhceph-3-tools-rpms --enable=rhel-7-server-ansible-2.6-rpms

sudo yum -y install ansible
sudo yum -y install ceph-ansible
sudo yum -y update

# this command may be useful
#sudo subscription-manager repos --list

# for text console
sudo systemctl enable serial-getty@ttyS0.service
