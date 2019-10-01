#!/bin/bash

#this script is to create the first rhel image to be used on the lab

if ! type "sshpass" > /dev/null; then
  echo "You need to install sshpass"
  exit
fi

init-scripts/verify-variables.sh

. ./init-scripts/variables.profile

sshpass -p $ROOT_PASSWORD scp  -o "StrictHostKeyChecking no" -r init-scripts root@$BASE_IP:~/
sshpass -p $ROOT_PASSWORD ssh  -o "StrictHostKeyChecking no" root@$BASE_IP init-scripts/subscribe.sh
sshpass -p $ROOT_PASSWORD ssh  -o "StrictHostKeyChecking no" root@$BASE_IP init-scripts/update.sh
