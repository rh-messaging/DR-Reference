#!/usr/bin/env bash

export PRG_PATH=`dirname $0`
export VARIABLES_FILE=$PRG_PATH/variables.profile

if [ ! -f $VARIABLES_FILE ]; then
  echo "Define the location of the KVM Guest Image you downloaded from access.redhat.com:"
  read BASE_IMAGE

  echo "Define the location where KVM images should be installed:"
  read DISK_LOCATION

  export BASE_IP=10.0.0.100

  echo "BASE_IMAGE=$BASE_IMAGE" > $VARIABLES_FILE
  echo "BASE_IP=10.0.0.100" >> $VARIABLES_FILE

  echo "DISK_LOCATION=$DISK_LOCATION" >> $VARIABLES_FILE

  echo "Define the root password for your instances"
  read ROOT_PASSWORD

  echo "ROOT_PASSWORD=$ROOT_PASSWORD" >> $VARIABLES_FILE

  echo "Please type your access.redhat.com username:"
  read REDHAT_USER
  echo "Please type your access.redhat.com password:"
  read REDHAT_PASSWORD

  echo "REDHAT_USER=$REDHAT_USER" >> $VARIABLES_FILE
  echo "REDHAT_PASSWORD=$REDHAT_PASSWORD" >> $VARIABLES_FILE

else
  . $VARIABLES_FILE

  echo "Recovered configuration from variables.profile"
  echo "DISK_LOCATION = $DISK_LOCATION"
  echo "BASE_IMAGE = $BASE_IMAGE"
  echo "ROOT_PASSWORD = $ROOT_PASSWORD"
fi
