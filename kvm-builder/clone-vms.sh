#!/bin/bash

ORIGIN=$(dirname $(readlink -f $0))

./init-scripts/verify-variables.sh
. ./init-scripts/variables.profile

# After the first image is created and configured, this script will clone N copies to be used

if [ "$#" -ne 1 ]; then
    echo "Usage ./clone-vms.sh [create-file?]"
    echo "create-file : Y | N"
    echo "if you pass N it means you will just redefine the VMs using the same previous disk"
    exit
fi

cd $DISK_LOCATION

echo $PWD

CREATE=$1

virsh shutdown ceph_ansible

add_osd() {

    NAME=$1

	echo attaching OSD disk on $NAME
	if [ $CREATE = "Y" ]; then
	    dd if=/dev/zero of=$NAME-osd.img bs=1M count=2048
	fi
	sudo virsh attach-disk $NAME `pwd`/$NAME-osd.img vdb --cache none --persistent
}

create_VM() {
    NAME=$1
    MAC=$2
    # this is used just for printing the line to be used on network.xml
    IP=$3

    if [ $CREATE = "Y" ]; then
       cp ceph_ansible.qcow2 $NAME.qcow2
    fi
    sudo virsh destroy $NAME
    sudo virsh undefine $NAME
    sudo virt-install --name $NAME --memory 2048 --vcpus 1 --disk $NAME.qcow2 --import --os-variant rhel7 --network network=cephlab,mac=$MAC --print-xml > $NAME.xml
    sudo virsh define $NAME.xml

    echo "<host mac='$MAC' name='$NAME' ip='$IP'/>" >> hosts.xml
    echo "$IP	$NAME" >> hosts

    echo Host $NAME created

}

create_VM DC1 52:54:00:c2:aa:02 10.0.0.101
create_VM DC2 52:54:00:c2:aa:03 10.0.0.102
create_VM DC3 52:54:00:c2:aa:04 10.0.0.103

create_VM DC1_OSD1 52:54:00:c2:aa:05 10.0.0.104
create_VM DC1_OSD2 52:54:00:c2:aa:06 10.0.0.105
create_VM DC1_OSD3 52:54:00:c2:aa:07 10.0.0.106

add_osd DC1_OSD1
add_osd DC1_OSD2
add_osd DC1_OSD3

create_VM DC2_OSD1 52:54:00:c2:aa:08 10.0.0.107
create_VM DC2_OSD2 52:54:00:c2:aa:09 10.0.0.108
create_VM DC2_OSD3 52:54:00:c2:aa:10 10.0.0.109

add_osd DC2_OSD1
add_osd DC2_OSD2
add_osd DC2_OSD3

create_VM client1 52:54:00:c2:aa:11 10.0.0.110
create_VM client2 52:54:00:c2:aa:12 10.0.0.111
create_VM client3 52:54:00:c2:aa:13 10.0.0.112

if [ $CREATE = "Y" ]; then
    cd $ORIGIN
    ./start-lab.sh
    sleep 60
    ./subscribe-all.sh
fi
