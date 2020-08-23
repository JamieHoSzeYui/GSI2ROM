#!/bin/bash

clear
figlet GSI2ROM

echo "Cleaning up .."
rm -rf ../output
echo "Moving input .."
mkdir cache
cp ../input/*.img cache/
echo "Converting image.."
simg2img cache/*.img cache/system.img
mkdir system
sudo mount cache/system.img system
bash fixes.sh
sudo umount system
echo "repacking ROM.."
mkdir temp
mv cache/system.img temp/
rm -rf cache
echo "Converting raw image to sparse.."
mv temp/system.img temp/system.img.raw
img2simg temp/system.img.raw temp/system.img
rm -rf temp/system.img.raw
echo "Converting sparse image into dat format .."
./tools/img2sdat/img2sdat.py temp/system.img -o working -v 4 
rm -rf temp
cp -r prebuilt/template/ working/
cd working
echo "Brotli system files .."
brotli -3jf system.new.dat
echo "Almost done. Zipping .."
zip -r final.zip .
cd ..
mkdir ../output
mv working/final.zip ../output/
rm -rf working

figlet Done
echo "Enjoy your port !"

