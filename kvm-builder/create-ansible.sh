#!/bin/bash

#this script is to create the first rhel image to be used on the lab

if ! type "sshpass" > /dev/null; then
  echo "You need to install sshpass"
  exit
fi

init-scripts/verify-variables.sh

. ./init-scripts/variables.profile

./define-network.sh


if [ ! -d $DISK_LOCATION ]; then
   echo "Creating $DISK_LOCATION"
   mkdir $DISK_LOCATION
fi

if [ ! -f $DISK_LOCATION/ceph_ansible.qcow2 ]; then
   export CREATE="Y"
    cp $BASE_IMAGE $DISK_LOCATION/ceph_ansible.qcow2
    sudo virt-customize -a $DISK_LOCATION/ceph_ansible.qcow2 --root-password password:$ROOT_PASSWORD --uninstall cloud-init
else
    export CREATE="N"
fi

sudo virsh destroy ceph_ansible
sudo virsh undefine ceph_ansible
sudo virt-install --name ceph_ansible --memory 2048 --vcpus 1 --disk $DISK_LOCATION/ceph_ansible.qcow2 --import --os-variant rhel7 --print-xml --network network=cephlab,mac=52:54:00:c2:ad:01 > $DISK_LOCATION/ceph_ansible.xml
sudo virsh define $DISK_LOCATION/ceph_ansible.xml

if [ $CREATE = "Y" ]; then
    sudo virsh start ceph_ansible
    sleep 10
    ./update-ansible.sh
    sshpass -p $ROOT_PASSWORD scp  -o "StrictHostKeyChecking no" -r init-scripts root@$BASE_IP:~/
    sshpass -p $ROOT_PASSWORD ssh  -o "StrictHostKeyChecking no" root@$BASE_IP init-scripts/subscribe.sh
    sshpass -p $ROOT_PASSWORD ssh  -o "StrictHostKeyChecking no" root@$BASE_IP init-scripts/update.sh
fi
