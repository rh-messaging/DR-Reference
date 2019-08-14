#!/bin/bash

mkdir ~/ceph-ansible-keys
sudo ln -s /usr/share/ceph-ansible/group_vars /etc/ansible/group_vars
sudo cp all.yml /etc/ansible/group_vars/all.yml
sudo cp osds.yml /etc/ansible/group_vars/osds.yml
sudo cp clients.yml /etc/ansible/group_vars/clients.yml
sudo cp ansible-hosts /etc/ansible/hosts
sudo cp /usr/share/ceph-ansible/site.yml.sample /usr/share/ceph-ansible/site.yml

sudo mkdir /var/log/ansible
sudo chown ansible:ansible /var/log/ansible
sudo chmod 755 /var/log/ansible


sudo cp etcansible.cfg /etc/ansible/ansible.cfg
sudo cp cephansible.cfg /usr/share/ceph-ansible/ansible.cfg


## This next step is to make sure ansible will not freeze on host verification over ssh 
ssh -o "StrictHostKeyChecking no" ansible@ceph02 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph03 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph04 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph05 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph06 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph07 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph08 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph09 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph10 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph11 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph12 'echo ok'
ssh -o "StrictHostKeyChecking no" ansible@ceph13 'echo ok'



