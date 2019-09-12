#!/bin/bash

# This script is to be executed inside the VM 

export PRG_PATH=`dirname $0`

sudo yum -y install ansible
sudo yum -y install ceph-ansible
sudo yum -y update

# this command may be useful
#sudo subscription-manager repos --list

# for text console
sudo systemctl enable serial-getty@ttyS0.service
