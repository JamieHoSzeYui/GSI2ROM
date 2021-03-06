#!/bin/bash

# Setup for GSI2ROM (what a cringey project. oof.)

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    distro=$(awk -F= '$1 == "ID" {print $2}' /etc/os-release)
    if [[ "$distro" == "arch" ]]; then
       echo "Arch Linux Detected"
       sudo pacman -S --needed unace unrar zip unzip p7zip sharutils uudeview arj cabextract file-roller dtc xz python3-pip brotli lz4 gawk libmpack aria2 img2simg brotli figlet 
       #aur=rar
       https://aur.archlinux.org/simg-tools.git temp
       cd temp
       makepkg -si --skippgpcheck
       cd ..
       rm -rf temp
    else
       sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python3-pip brotli liblz4-tool gawk aria2 brotli img2simg simg2img figlet
    fi
    pip3 install backports.lzma protobuf pycrypto
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install protobuf xz brotli lz4 aria2 img2simg simg2img figlet 
    pip install backports.lzma protobuf pycrypto
fi

git clone https://github.com/xpirt/img2sdat tools/img2sdat

mkdir input

echo "You are ready to use GSI2ROM !"
