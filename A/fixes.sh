#!/bin/bash

#Fixes patcher

clear
figlet Fixes
figlet Patcher

echo "Welcome to Fixes patcher. Choose your fixes"

echo " 1 : OOS Data Fix "
echo " 2 : VOS Rounded corner fix"
echo " 0 : exit "

read -p "Apply Fix : " fix

if [[ $fix = 1 ]]; then
   bash prebuilt/oosdata.sh
elif [[ $fix = 2 ]]; then
   bash prebuilt/vosround.sh
elif [[ $fix = 3 ]]; then
     bash make2.sh
fi

