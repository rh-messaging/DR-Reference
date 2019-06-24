mkdir /mnt/ceph
scp root@ceph4:~/secret .
mount -t ceph ceph4:/ /mnt/cephfs -o name=admin,secretfile=/root/secret
chown ansible:ansible /mnt/cephfs
