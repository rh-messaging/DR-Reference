#!/usr/bin/env bash
mkdir /mnt/cephfs
scp root@ceph04:~/secret ~/
mount -t ceph DC1:/ /mnt/cephfs -o name=admin,secretfile=/root/secret
chown ansible:ansible /mnt/cephfs
