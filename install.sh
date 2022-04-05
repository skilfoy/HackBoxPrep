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
apt-get autoremove
apt-get install -y libwacom-common

echo '## Upgrade & Update'
apt-get install -y upgrade
apt-get install -y update
apt-get install -y upgrade
apt-get autoremove

# Toolset
echo '## Building Toolset'

mkdir ~/Documents/Tools

# Git Clones

echo '[$$] Installing Sn1per...'
cd ~/Documents/Tools
git clone https://github.com/1N3/Sn1per
cd Sn1per
bash install.sh

echo '[$$] Installing ReverseAPK...'
cd ~/Documents/Tools
git clone https://github.com/1N3/ReverseAPK.git
cd ReverseAPK.git
./install

echo '[$$] Installing PRISM-AP...'
cd ~/Documents/Tools
git clone https://github.com/1N3/PRISM-AP.git
cd PRISM-AP
./install.sh

echo '[$$] Cloning Powershell Tools...'
cd ~/Documents/Tools
git clone https://github.com/danielbohannon/Invoke-Obfuscation.git
git clone https://github.com/puckiestyle/powershell.git

echo '[$$] Installing Sparta...'
cd ~/Documents/Tools
apt install python3-sqlalchemy python3-pyqt5 wkhtmltopdf
apt-get install ldap-utils rwho rsh-client x11-apps finger
cd /usr/share
git clone https://github.com/secforce/sparta.git
mv sparta/sparta /usr/bin
cd /usr/bin
chmod +x sparta

echo '[$$] Installing HaxUnit...'
cd ~/Documents/Tools
git clone https://github.com/Bandit-HaxUnit/haxunit
cd haxunit
python3 -m pip install -r requirements.txt
python3 main.py --install

echo '[$$] Installing ***...'



echo '[$$] API Key Installation (for subfinder, wpscan)'
echo 'Enter Binaryedge API Key:'
read Binaryedge_API_Key
echo 'Enter C99 API Key:'
read C99_API_Key
echo 'Enter Certspotter API Key:'
read Certspotter_API_Key
echo 'Enter Chinaz API Key:'
read Chinaz_API_Key
echo 'Enter Censys API Key'
read Censys_API_Key
echo 'Enter Chaos API Key:'
read Chaos_API_Key
echo 'Enter DnsDB API Key:'
read DnsDB_API_Key
echo 'Enter Fofa API Key:'
read Fofa_API_Key
echo 'Enter Github API Key:'
read Github_API_Key
echo 'Enter Intelx API Key:'
read Intelx_API_Key
echo 'Enter Passivetotal API Key:'
read Passivetotal_API_Key
echo 'Enter Robtex API Key:'
read Robtex API Key
echo 'Enter SecurityTrails API Key:'
read SecurityTrails_API_Key
echo 'Enter Shodan API Key'
read Shodan_API_Key
echo 'Enter Spyse API Key'
read Spyse_API_Key
echo 'Enter Threatbook API Key:'
read Threatbook_API_Key
echo 'Enter Virustotal API Key:'
read Virustotal_API_Keecho 'Enter Zoomeye API Key:'
read Zoomeye_API_Key

echo 'Enter WPScan API Key:'
read WPScan_API_Key
wpscan --wpscan-api-token $WPSCAN_API_Key







