#!/usr/bin/env bash
. ./init-scripts/variables.profile

set -e

UpdateInstances=("ceph_ansible" "DC1" "DC2" "DC3" "DC1_OSD1" "DC1_OSD2" "DC1_OSD3" "DC2_OSD1" "DC2_OSD2" "DC2_OSD3")

# this script will run subscriptions on all your virtual boxes
for ip in ${UpdateInstances[*]}
do
	echo $ip
	sshpass -p $ROOT_PASSWORD scp -o "StrictHostKeyChecking no" -r init-scripts root@$ip:~/
	nohup sshpass -p $ROOT_PASSWORD ssh -o "StrictHostKeyChecking no" root@$ip ./init-scripts/subscribe.sh 1>subscribe.$ip.log 2>subscribe.$ip.erlog &
done
exit
