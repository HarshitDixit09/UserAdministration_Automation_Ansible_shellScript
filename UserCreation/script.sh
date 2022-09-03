#!/bin/bash
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
NORMAL="\033[0;39m"
echo -e $BIPurple'Enter User Name which needs to be created' $NORMAL
read usernme
echo -e $BIPurple'Enter home directory' $NORMAL
read hme
echo -e $BIPurple'Enter User ID which needs to be created' $NORMAL
read usrid
echo -e $BIPurple'Enter Primary Group Name or Group ID' $NORMAL
read grpid
echo -e $BIPurple'Enter Seconday Group name separted by , if there are multiple secondary groups'
read sgrpnm
echo -e $BIPurple'Enter comments for User' $NORMAL
read cmmts
cat usercr3.yml | sed "s/usernme/$usernme/g"| sed "s/usrid/$usrid/g" | sed "s/pgrnm/$grpid/g"| sed "s/cmmts/$cmmts/g" | sed "s/sgrnms/$sgrpnm/g" | sed "s~hmg~$hme~g" > usercr2.yml
ansible-playbook usercr2.yml -i inventory.txt  --key-file /root/keypair
sleep 20
