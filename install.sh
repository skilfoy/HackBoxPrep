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



echo '[$$] API Key Installation (for haxunit, subfinder, wpscan functionality)'
read -sp 'Enter Binaryedge API Key: ' Binaryedge_API_Key
read -sp 'Enter C99 API Key: ' C99_API_Key
read -sp 'Enter Certspotter API Key: ' Certspotter_API_Key
read -sp 'Enter Chinaz API Key: ' Chinaz_API_Key
read -sp 'Enter Censys API Key: ' Censys_API_Key
read -sp 'Enter Chaos API Key: ' Chaos_API_Key
read -sp 'Enter DnsDB API Key: ' DnsDB_API_Key
read -sp 'Enter Fofa API Key: ' Fofa_API_Key
read -sp 'Enter Github API Key: ' Github_API_Key
read -sp 'Enter Intelx API Key: ' Intelx_API_Key
read -sp 'Enter Passivetotal API Key: ' Passivetotal_API_Key
read -sp 'Enter Robtex API Key: ' Robtex API Key
read -sp 'Enter SecurityTrails API Key: ' SecurityTrails_API_Key
read -sp 'Enter Shodan API Key ' Shodan_API_Key
read -sp 'Enter Spyse API Key ' Spyse_API_Key
read -sp 'Enter Threatbook API Key: ' Threatbook_API_Key
read -sp 'Enter Virustotal API Key: ' Virustotal_API_Key
read -sp 'Enter Zoomeye API Key: ' Zoomeye_API_Key
read -sp 'Enter WPScan API Key: ' WPScan_API_Key
echo 'cli_options:\n\tapi_token: ${WPScan_API_Key}' > ~/.wpscan/scan.yml







