#!/bin/bash

export PRG_PATH=`dirname $0`
. $PRG_PATH/verify-variables.sh


set -e

subscription-manager --username=$REDHAT_USER --password=$REDHAT_PASSWORD register --auto-attach --f

#sudo subscription-manager attach --pool=8a85f98460bfb0470160c2facadf3706
sudo subscription-manager repos --disable=*
sudo subscription-manager repos --enable=rhel-7-server-rpms
sudo subscription-manager repos --enable=rhel-7-server-extras-rpms

echo "done!"
