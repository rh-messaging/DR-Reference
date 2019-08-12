mkdir /mnt/cephfs
scp root@ceph04:~/secret .
mount -t ceph ceph04:/ /mnt/cephfs -o name=admin,secretfile=/root/secret
chown ansible:ansible /mnt/cephfs
