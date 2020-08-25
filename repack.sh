#!/bin/bash

echo "Unmounting Images.."
sudo umount system
echo "Converting image to .dat format .."
mv cache/system.img cache/system.img.raw
img2simg cache/system.img.raw cache/system.img
./tools/img2sdat/img2sdat.py cache/system.img -o temp -v 4 
rm -rf cache
cp -r prebuilt/scripts/normal/ temp
cd temp
brotli -3jf system.new.dat
read -p "Name your zip : " zipname
zip -r $zipname-GSI2ROM.zip .
cd ../
mv temp/*.zip output/
echo "GSI2ROM done at output/$zipname-GSI2ROM.zip"
rm -rf temp cache system working
