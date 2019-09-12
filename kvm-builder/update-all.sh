#!/usr/bin/env bash
. ./init-scripts/variables.profile

set -e

# this script will run yum update on all the systems
for ip in {100..112}
do
	echo 10.0.0.$ip
	sshpass -p $ROOT_PASSWORD scp -o "StrictHostKeyChecking no" -r init-scripts root@10.0.0.$ip:~/
	nohup sshpass -p $ROOT_PASSWORD ssh -o "StrictHostKeyChecking no" root@10.0.0.$ip ./init-scripts/update.sh 1>update.$ip.log 2>update.$ip.erlog &
done
exit
