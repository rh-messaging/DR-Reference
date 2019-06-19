#Setting up a ceph lab on a KVM environment


- Prerequisites:

** KVM and KMM installed



- Step1:

Download a RHEL7 Image, or build one: I suggest "Red Hat Enterprise Linux 7.7 Update KVM Guest Image" from access.redhat.com downloads
Place the file on this folder.


- Step2:

- Create the VM:

Run the script create-vm.sh  Make sure the variable BASE_IMAGE on the script points to the corret file you downloaded

- Start the VM

Connect on the vm, with user root/redhat

Do the following commands:


subscription-manager register
subscription-manager subscribe
useradd ansible
passwd ansible
# type the password


- with a visudo:
add ansible to the last line:

ansible		ALL=(ALL)	NOPASSWORD: ALL


- figure out what is the IP of the machine



- Step3: 

On the host, copy complete-vm.sh on ceph02

scp complete-vm.sh ansible@<IP FOR CEPH02>:~/compete-vm.sh

connect on the machine using ansible user: and run complete-vm.sh


- Step4:

Stop ceph1 and on the host, run clone-vms.sh


- Step5:

Copy everything under ./prepare-ansible on ceph02, and run ./prepare-ansible.sh inside the guest


#- Step5:
#
#I couldn't get around this, on each node:
#subscription-manager register --f
#subscription manager subscribe

- Step6:




