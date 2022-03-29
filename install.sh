#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

mkdir ~/Documents/Tools
cd ~/Documents/Tools

# Git Clones
echo '[$$] Installing Sn1per...'
git clone https://github.com/1N3/Sn1per
cd Sn1per
bash install.sh
cd ~/Documents/Tools

echo '[$$] Installing ReverseAPK...'
git clone https://github.com/1N3/ReverseAPK.git
cd ReverseAPK.git
./install
cd ~/Documents/Tools

echo '[$$] Installing PRISM-AP...'
git clone https://github.com/1N3/PRISM-AP.git
cd PRISM-AP
./install.sh
cd ~/Documents/Tools

echo '[$$] Cloning Powershell Tools...'
git clone https://github.com/danielbohannon/Invoke-Obfuscation.git
git clone https://github.com/puckiestyle/powershell.git
