#!/bin/bash

#Putting Color Optio

BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
NORMAL="\033[0;39m"
clear
target=None

#Creating a function

my_head()
{
echo -e $BIBlue"*********************************************************************************************************** \n"
        echo -e " Automation Tool to automate the day to day Unix Tasks !!!! \c"
        echo -e " \tTarget Server : $target \n"
echo -e "***********************************************************************************************************\n"$NORMAL

}

while true
do
my_head  #Function call

        echo -e $BIRed "Please select your choice from the below menu \n"
        echo -e " 1. Pre-Validation \n"
        echo -e " 2. User Administration \n"
        echo -e " 3. Run Ad-Hoc commands \n"
        echo -e " 22. Options \n"
        echo -e " 0. Exit \n" $NORMAL
        read cho
        case $cho in

        0)
        break
        ;;
        1)
        if [ $target = "None" ]; then
        echo -e " Select target server fron option 22 "
        read dummy
        else
        echo "Welcome to Pre-Validation"
        sleep 4
        fi
        ;;

# While Under While Loop

        2)
        if [ $target = "None" ]; then
        echo -e " Select target server fron option 22 "
        read dummy
        else

        echo -e "Welcome to User Administration Please select your choise below \n"
        while true
        do
                echo -e $BIGreen" 1. User Creation \n"
                echo -e " 2. User Deletion \n"
                echo -e " 3. Group Add \n"
                echo -e " 0. Exit " $NORMAL
                read cho1
                case $cho1 in

                0)
                break
                ;;
                1)
                echo -e " Welcome to user Creation \n"
                cd /root/usercreation
                cat usercr1.yml | sed "s/target1/$target/g" > usercr3.yml
                ./script.sh
                sleep 4
                ;;
                2)
                echo -e "Welcome to user  Deletion \n"
                cd /root/userdeletion
                cat usercr.yml | sed "s/xyz/$target/g" > usercr_new.yml
                ./script.sh
                sleep 4
                ;;
                3)
                echo -e "Welcome to Group add \n"
                cd /root/groupadd
                cat groupadd.yml | sed "s/xyz/$target/g" > groupadd2.yml
                ./script.sh
                sleep 4
                ;;
                *)
                echo " Wrong Choice !!!!!!! "
                read dummy
                continue
                ;;
                esac
                done
        fi
# While under while ends


        ;;
        3)
        if [ $target = "None" ]; then
        echo -e " Select target server fron option 22 "
        read dummy
        else

        echo "Welcome to Run ed-Hoc command"
        fi
        ;;

        22)
                while true
                do
                        clear
                        my_head
                        echo -e " 1.  Trial : $try "
                        echo -e " 2.  Target Servers \n "
                        echo -e " 0.  Exit      \n "
                        echo -e " Enter your Choice : \c"
                        read cho
                        case $cho in

                        0)
                                clear
                                break
                                ;;
                        2)
                                echo -e ----------------------------------------------------------------------------
                                echo -e "Available Env :  All -> for All Server in this Env or Host IP "
                                cat /etc/ansible/hosts  | grep "\[" | sed "s/\[/ /g"  |  sed "s/\]/ /g"
                                echo -e ----------------------------------------------------------------------------
                                echo -e " Enter your Choice : \c"
                                read target
                                ;;
                        *)
                                echo -e "Wrong Choice !!!!"
                                read dummy
                                continue
                                ;;
                        esac
                done
                ;;
        *)
        echo " Wrong Choice !!!!!!!! "
        read dummy
        continue
        esac

done
