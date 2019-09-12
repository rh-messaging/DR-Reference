#!/usr/bin/env bash

ORIGIN=$(dirname $(readlink -f $0))
cd ~/

ssh-keygen -t rsa
chmod 700 .ssh
cd .ssh
cp id_rsa.pub authorized_keys
chmod 640 authorized_keys

cp $ORIGIN/ssh-config config
chmod 700 config
