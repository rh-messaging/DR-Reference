#!/bin/bash

virsh net-destroy cephlab
virsh net-undefine cephlab
virsh net-define network.xml
virsh net-autostart cephlab
virsh net-start cephlab
