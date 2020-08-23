#!/bin/bash

figlet GSI2ROM
echo " By henloboi"

echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""

echo "Aonly or AB ?"
echo " 1 : Aonly "
echo " 2 : AB"

read -p "Image type : " type

if [[ $type = 1 ]]; then
   cd A
   bash run.sh
elif [[ $type = 2 ]]; then
   cd AB
   bash run.sh
else 
   echo "Unknown command."
fi
