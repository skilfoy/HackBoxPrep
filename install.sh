#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

mkdir ~/Documents/Tools
cd ~/Documents/Tools

# Kali-everything
echo '## Installing All Kali Tools...'
apt-get install -y kali-tools-everything

echo '## Cleaning up...'
apt-get autoremove
apt-get install -y libwacom-common

echo '## Upgrade & Update...'
apt-get install -y upgrade
apt-get install -y update
apt-get install -y upgrade
apt-get autoremove

# Toolset
echo '## Building Toolset...'

mkdir ~/Documents/Tools

# Manual Installs

echo '[$$] To install Nexpose, enter information, download installer,'
echo '[$$] run chmod +x on .bin file, then execute .bin with ./'
xdg-open https://www.rapid7.com/try/nexpose

# apt installs

echo '[$$] Installing Certspotter...'
apt install -y certspotter

echo '[$$] Installing Konsole...'
apt-get install -y konsole

echo '[$$] Installing Docker Engine...' 
apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  buster stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
chmod a+r /usr/share/keyrings/docker-archive-keyring.gpg
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

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

echo '[$$] Installing SiteBroker...'
cd ~/Documents/Tools
git clone https://github.com/Anon-Exploiter/SiteBroker
cd SiteBroker
pip install -r requirements.txt

echo '[$$] Installing Docker Compose V2...'
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
docker compose version

echo '[$$] Installing OWTF...'
cd ~/Documents/Tools
git clone https://github.com/owtf/owtf
cd owtf
python3 setup.py develop
xterm -e 'make compose'
xdg-open http://localhost:8009

echo '[$$] Installing LinEnum...'
cd ~/Documents/Tools
git clone https://github.com/rebootuser/LinEnum.git

echo '[$$] Installing phpsploit...'
cd ~/Documents/Tools
git clone https://github.com/nil0x42/phpsploit
cd phpsploit/
pip3 install -r requirements.txt
alias phpsploit='~/Documents/Tools/phpsploit/phpsploit'

echo '[$$] Installing Nettacker...'
cd ~/Documents/Tools
git clone https://github.com/OWASP/Nettacker.git
cd Nettacker
pip3 -install -r requirements
xterm -e 'python3 nettacker.py --start-api --api-port 5003' &
xdg-open https://nettacker-api.z3r0d4y.com:5003

echo '[$$] Installing Boon...'
cd ~/Documents/Tools
git clone https://github.com/Nefcore/boon.git
cd boon
python3 setup.py install

echo '[$$] Installing CRLFsuite...'
cd ~/Documents/Tools
git clone https://github.com/Nefcore/CRLFsuite.git
cd CRLFsuite
sudo python3 setup.py install

echo '[$$] Installing RustScan...'
cd ~/Documents/Tools
RS_LOCATION=$(curl -s https://api.github.com/repos/RustScan/RustScan/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/RustScan/RustScan/releases/download/" substr($2, 2, length($2)-3) "_amd64.deb}') \
; curl -L -o RustScan.deb $RS_LOCATION
dpkg -i RustScan.deb

echo '[$$] Installing Katana...'
cd ~/Documents/Tools
git clone https://github.com/TebbaaX/Katana.git
cd Katana
pip3 install -r requirements.txt
alias kds='python3 ~/Documents/Tools/Katana/kds.py'

echo '[$$] Installing Ciphey...'
python3 -m pip install ciphey --upgrade

echo '[$$] Installing ***...'
cd ~/Documents/Tools



echo '[$$] Installing ***...'



echo '[$$] API Key Installation (for haxunit, subfinder, wpscan functionality)'
read -sp 'Enter Binaryedge API Key: ' Binaryedge_API_Key
read -sp 'Enter C99 API Key: ' C99_API_Key
read -sp 'Enter otter (SSLmate) API Key: ' Certspotter_API_Key
read -sp 'Enter Censys API ID: ' Censys_API_ID
read -sp 'Enter Censys API Secret: ' Censys_API_Secret
read -sp 'Enter Chaos API Key: ' Chaos_API_Key
read -sp 'Enter DnsDB API Key: ' DnsDB_API_Key
read -sp 'Enter Fofa API Key: ' Fofa_API_Key
read -sp 'Enter Github API Key: ' Github_API_Key
read -sp 'Enter Intelx API Key: ' Intelx_API_Key
read -sp 'Enter Passivetotal API Key: ' Passivetotal_API_Key
read -sp 'Enter SecurityTrails API Key: ' SecurityTrails_API_Key
read -sp 'Enter Shodan API Key ' Shodan_API_Key
read -sp 'Enter Spyse API Key ' Spyse_API_Key
read -sp 'Enter Seebug API Key ' Seebug_API_Key
read -sp 'Enter Virustotal API Key: ' Virustotal_API_Key
read -sp 'Enter Zoomeye API Key: ' Zoomeye_API_Key
read -sp 'Enter WPScan API Key: ' WPScan_API_Key
echo 'binaryedge: \
\t- $Binaryedge_API_Key \
c99: \
\t- $C99_API_Key \
Certspotter: \
\t- $Certspotter_API_Key \
Censys: \
\t- $Censys_API_ID \
\t- $Censys_API_Secret \
Chaos: \
\t- $Chaos_API_Key \
DnsDB: \
\t- $DnsDB_API_Key \
Fofa: \
\t- $Fofa_API_Key \
Github: \
\t- $Github_API_Key \
Intelx: \
\t- $Intelx_API_Key \
Passivetotal: \
\t- $Passivetotal_API_Key \
SecurityTrails: \
\t- $SecurityTrails_API_Key \
Seebug: \
\t- $Seebug_API_Key \
Shodan: \
\t- $Shodan_API_Key \
Spyse: \
\t- $Spyse_API_Key \
Virustotal: \
\t- $Virustotal_API_Key \
Zoomeye: \
\t- $Zoomeye_API_Key \
' > $HOME/.config/subfinder/provider-config.yaml

echo 'api_key $Certspotter_API_Key' > /etc/sslmate.conf


echo 'cli_options:\n\tapi_token: ${WPScan_API_Key}' > ~/.wpscan/scan.yml







