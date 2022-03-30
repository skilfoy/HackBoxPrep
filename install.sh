#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

mkdir ~/Documents/Tools
cd ~/Documents/Tools

# Kali-everything
echo '## Installing All Kali Tools'
sudo apt-get install -y kali-tools-everything

echo '## Cleaning up'
sudo apt-get autoremove
sudo apt-get install -y libwacom-common

echo '## Upgrade & Update'
sudo apt-get install -y upgrade
sudo apt-get install -y update
sudo apt-get install -y upgrade
sudo apt-get autoremove

# Toolset
echo '## Building Toolset'

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
cd ~/Documents/Tools

echo '[$$] Installing Sparta...'
apt install python3-sqlalchemy python3-pyqt5 wkhtmltopdf
apt-get install ldap-utils rwho rsh-client x11-apps finger
cd /usr/share
git clone https://github.com/secforce/sparta.git
mv sparta/sparta /usr/bin
cd /usr/bin
chmod +x sparta
cd ~/Documents/Tools

echo '[$$] Installing ***...'

