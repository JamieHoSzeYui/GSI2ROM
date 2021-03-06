#!/bin/bash
#Fixes patcher
clear
figlet Fixes
figlet Patcher
ls
echo "Welcome to Fixes patcher. Choose your fixes"
echo " 1 : OOS Data Fix "
echo " 2 : VOS Rounded corner fix"
echo " 3 : Enable OnScreen Keys on first boot"
echo " 4 : Edit BuildProp Manually using nano"
echo " 5 : MIUI : Fix Mi Account + Hotspot"
echo " 0 : exit "
read -p "Apply Fix : " fix
if [[ $fix = 1 ]]; then
        echo "Patching .."
        cp prebuilt/fixes/oosdata/OOSData.rc system/system/etc/init
        sudo chmod 0644 system/etc/init/OOSData.rc
        bash prebuilt/fixab.sh
elif [[ $fix = 2 ]]; then
        cp prebulit/fixes/vosround/VosOverlay.apk system/system/overlay
        sudo chmod 0644 system/overlay/VosOverlay.apk
        bash prebuilt/fixab.sh
elif [[ $fix = 3 ]]; then
        sudo echo "qemu.hw.mainkeys=0" >> system/system/build.prop
        bash prebuilt/fixab.sh
elif [[ $fix = 4 ]]; then
        sudo nano system/system/build.prop
        bash prebuilt/fixab.sh
elif [[ $fix = 5 ]]; then
        sudo echo "ro.product.device=india" >> system/build.prop
        sudo rm -rf system/system/priv-app/Provision
        sudo rm -rf system/system/app/XiaomiServicesFramework
        bash prebuilt/fixab.sh
elif [[ $fix = 0 ]]; then
        bash repack.sh
fi
