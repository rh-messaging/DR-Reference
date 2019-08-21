# Create CRUSH bucket for each datacenter
ceph osd crush add-bucket dc1 datacenter
ceph osd crush add-bucket dc2 datacenter

ceph osd crush move ceph06 datacenter=dc1
ceph osd crush move ceph07 datacenter=dc1
ceph osd crush move ceph08 datacenter=dc1

ceph osd crush move ceph09 datacenter=dc2
ceph osd crush move ceph10 datacenter=dc2
ceph osd crush move ceph11 datacenter=dc2

ceph osd crush move dc1 root=default
ceph osd crush move dc2 root=default


# Create CRUSH rule to map replicas across datacenters
# ceph osd crush rule create-replicated <rule-name> <root> <failure-domain> <class>
ceph osd crush rule create-replicated multi-dc default datacenter hdd # or ssd if the cluster is all ssd

# Configure existing pool to use the new rule, this will cause data to backfill to the new ideal
# destinations, data movement is completely when no backfilling is shown by 'ceph -s'
ceph osd pool set cephfs_data crush_rule multi-dc
ceph osd pool set cephfs_metadata crush_rule multi-dc

ceph osd pool set cephfs_metadata pg_num 128
ceph osd pool set cephfs_metadata pgp_num 128

ceph osd pool set cephfs_data pg_num 128
ceph osd pool set cephfs_data pgp_num 128
