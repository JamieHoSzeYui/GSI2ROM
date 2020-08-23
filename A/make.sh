#!/bin/bash

clear
rm -rf output
echo "Please place GSI inside input folder."
read -p "Press any key to confirm"

mkdir working
mkdir temp
echo "Copying system image.."
mv input/*.img temp
mv temp/*.img temp/system.img
echo "Converting image into .dat .."
./tools/img2sdat/img2sdat.py temp/system.img -o working -v 4 -p system.new.dat
rm -rf temp
cd working
echo "Compressing with brotli.."
brotli -3jf system.new.dat
cp -r ../prebuilt/template/* .
echo "Almost done. Zipping.."
zip -r output.zip .
cd ..
mv working/output.zip output
rm -rf working

echo "Done. Check out folder"
