#!/bin/bash
echo -e "Enter the user name which needs to be deleted "
read user
cat usercr_new.yml | sed "s/usernme/$user/g " > usercr1.yml
ansible-playbook usercr1.yml -i inventory.txt --key-file keypair
sleep 10
