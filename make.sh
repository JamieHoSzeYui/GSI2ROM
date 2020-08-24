#!/bin/bash

# GSI2ROM shit by henloboi

clear
figlet GSI2ROM

read -p "Please place GSI inside input folder. press any key to continue."

if [[ $( ls input/ | grep AB) ]]; then
	echo "AB detected. Moving to AB script"
	bash ab.sh
elif [[ $(ls input/ | grep Aonly)]]; then
	echo "A Only detected, moving to A script"
	bash ao.sh
else 
	echo "Unknown GSI type, rename GSI !"
fi
