#!/bin/bash
echo -e " Enter the group name "
read grpnme
echo -e " Enter thr group ID ( Optional )"
read gidnum
cat groupadd2.yml | sed "s/abcd/$grpnme/g" | sed "s/gidvalue/$gidnum/g" > groupadd1.yml
ansible-playbook groupadd1.yml -i inventory.txt --key-file /root/keypair
