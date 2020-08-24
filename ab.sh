#!/bin/bash

echo "Creating folders"
mkdir temp
mkdir system
mkdir working
mkdir cache
echo "Unpacking GSI Image.."
simg2img input/*.img cache/system.img
rm -rf input/*.img

# Add 50MB for patching
sudo dd if=/dev/zero bs=1M count=50 >> cache/system.img
sudo e2fsck -f cache/system.img
sudo resize2fs cache/system.img
read -p "Resize Image? (Y/N)" resize
if [[ $resize = Y]]; then
	read -p "Size you want to add? Use - for decrease" size
	sudo dd if=/dev/zero bs=1M count=$size >> cache/system.img
        sudo e2fsck -f cache/system.img
        sudo resize2fs cache/system.img
        echo "Resize done !"	

elif [[ $fix = y ]]; then
	read -p "Size you want to increase? Use - for decrease" size
	sudo dd if=/dev/zero bs=1M count=$size >> cache/system.img
	sudo e2fsck -f cache/system.img
	sudo resize2fs cache/system.img
	echo "Resize done !"

echo "Mounting Images.."
sudo mount cache/system.img system

read -p "Apply Fixes (Y/N)? : " fix

if [[ $fix = Y]]; then
   bash prebuilt/fixab.sh
elif [[ $fix = y ]]; then
   bash prebuilt/fixab.sh
else 
   bash repack.sh
fi

