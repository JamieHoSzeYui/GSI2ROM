#!/bin/bash

# Temp. Repacking for including vendor in ROM (will be ditched soon)

clear

echo "Creating work and out folders .."
mkdir temp

read -p "Place your vendor zip inside input folder, in a ZIP format. Press any key to continue."

mv input/*.zip input/vendor.zip
unzip input/vendor.zip boot.img vendor.new.dat.br vendor.transfer.list vendor.patch.dat -d temp

echo "Unzipping System.."
unzip output/*-GSI2ROM* system.new.dat.br system.patch.dat system.transfer.list -d temp

echo "Copying Meta .."
cp -r prebuilt/scripts/vendor/

echo "Almost done. Zipping.."
cd temp
zip -r GSI2ROM+Vendor.zip .
cd ..

echo "Cleaning up folders .."
cp "temp/GSI2ROM+Vendor.zip" output/
rm -rf temp

echo "Done !"
