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

echo '[$$] Installing PwnCat-CS...'
cd ~/Documents/Tools
pip install pwncat-cs

echo '[$$] Installing Chisel...'
curl https://i.jpillora.com/chisel! | bash

echo '[$$] Installing MongoDB Shell...'
cd ~/Documents/Tools
wget https://downloads.mongodb.com/compass/mongodb-mongosh_1.3.1_amd64.deb
dpkg -i mongodb-mongosh_1.3.1_amd64.deb

echo '[$$] Installing Autorecon ***...'
cd ~/Documents/Tools
apt install seclists curl enum4linux feroxbuster gobuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf
apt install python3-venv
python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git

echo '[$$] Installing LinWinPwn ***...'
cd ~/Documents/Tools
git clone https://github.comlefayjey/linWinPwn
cd linWinPwn
chmod +x linWinPwn.sh
chmod +x install.sh
./install.sh

echo '[$$] Installing SSRFire ***...'
cd ~/Documents/Tools
git clone https://github.com/ksharinarayanan/SSRFire.git
cd SSRFire
chmod +x setup.sh
./setup.sh
source .profile

echo '[$$] Installing SourceWolf ***...'
cd ~/Documents/Tools
git clone https://github.com/ksharinarayanan/SourceWolf
cd SourceWolf
pip3 install -r requirements.txt
alias sourcewolf='python3 ~/Documents/Tools/SourceWolf/sourcewolf.py'

echo '[$$] Installing ROADtools ***...'
cd ~/Documents/Tools
pip install roadlib
pip install roadrecon


echo '[$$] Installing $$$ ***...'
cd ~/Documents/Tools



## Curls

echo '[$$] Getting PSPY...'
cd ~/Documents/Tools
mkdir PSPY
cd PSPY
curl -L https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64 -o pspy64
chmod +x pspy64
curl -L https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64s -o pspy64s
chmod +x pspy64s
curl -L https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32 -o pspy32
chmod +x pspy32
curl -L https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32s -o pspy32s
chmod +x pspy32s

echo '[$$] Getting Chisel Toolkit...'
cd ~/Documents/Tools
mkdir Chisel
cd Chisel
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_darwin_amd64.gz -o chisel_1.7.7_darwin_amd64.gz
gunzip chisel_1.7.7_darwin_amd64.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_darwin_arm64.gz -o chisel_1.7.7_darwin_arm64.gz
gunzip chisel_1.7.7_darwin_amd64.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_386.gz -o chisel_1.7.7_linux_386.gz
gunzip chisel_1.7.7_linux_386.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_amd64.gz -o chisel_1.7.7_linux_amd64.gz
gunzip chisel_1.7.7_linux_amd64.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_arm64.gz -o chisel_1.7.7_linux_arm64.gz
gunzip chisel_1.7.7_linux_arm64.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_armv6.gz -o chisel_1.7.7_linux_armv6.gz
gunzip chisel_1.7.7_linux_armv6.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_armv7.gz -o chisel_1.7.7_linux_armv7.gz
gunzip chisel_1.7.7_linux_armv7.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_mips64le_softfloat.gz -o chisel_1.7.7_linux_mips64le_softfloat.gz
gunzip chisel_1.7.7_linux_mips64le_softfloat.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_mips64le_hardfloat.gz -o chisel_1.7.7_linux_mips64le_hardfloat.gz
gunzip chisel_1.7.7_linux_mips64le_hardfloat.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_mips64_hardfloat.gz -o chisel_1.7.7_linux_mips64_hardfloat.gz
gunzip chisel_1.7.7_linux_mips64_hardfloat.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_mips64_softfloat.gz -o chisel_1.7.7_linux_mips64_softfloat.gz
gunzip chisel_1.7.7_linux_mips64_softfloat.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_mipsle_hardfloat.gz -o chisel_1.7.7_linux_mipsle_hardfloat.gz
gunzip chisel_1.7.7_linux_mipsle_hardfloat.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_mipsle_softfloat.gz -o chisel_1.7.7_linux_mipsle_softfloat.gz
gunzip chisel_1.7.7_linux_mipsle_softfloat.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_mips_hardfloat.gz -o chisel_1.7.7_linux_mips_hardfloat.gz
gunzip chisel_1.7.7_linux_mips_hardfloat.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_mips_softfloat.gz -o chisel_1.7.7_linux_mips_softfloat.gz
gunzip chisel_1.7.7_linux_mips_softfloat.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_ppc64.gz -o chisel_1.7.7_linux_ppc64.gz
gunzip chisel_1.7.7_linux_ppc64.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_ppc64le.gz -o chisel_1.7.7_linux_ppc64le.gz
gunzip chisel_1.7.7_linux_ppc64le.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_s390x.gz -o chisel_1.7.7_linux_s390x.gz
gunzip chisel_1.7.7_linux_s390x.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_windows_amd64.gz -o chisel_1.7.7_windows_amd64.gz
gunzip chisel_1.7.7_windows_amd64.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_windows_arm64.gz -o chisel_1.7.7_windows_arm64.gz
gunzip chisel_1.7.7_windows_arm64.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_windows_armv6.gz -o chisel_1.7.7_windows_armv6.gz
gunzip chisel_1.7.7_windows_armv6.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_windows_armv7.gz -o chisel_1.7.7_windows_armv7.gz
gunzip chisel_1.7.7_windows_armv7.gz
curl -L https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_windows_386.gz -o chisel_1.7.7_windows_386.gz
gunzip chisel_1.7.7_windows_386.gz

echo '[$$] Getting Shocker - Docker Escape ***...'
cd ~/Documents/Tools
mkdir shocker-docker-escape
cd shocker-docker-escape
curl 'stealth.openwall.net/xSports/shocker.c' -o shocker.c
echo 'shocker: docker PoC VMM-container breakout

first Modify the file, then we compile it in our attack kali machine:

// get a FS reference from something mounted in from outside
if ((fd1 = open("/etc/hostname", O_RDONLY)) < 0)
    die("[-] open");

if (find_handle(fd1, "/root/root.txt", &root_h, &h) <= 0)
    die("[-] Cannot find valid handle!");
Dynamic compilation
gcc shocker.c -o shocker
' > usage.txt

echo '[$$] Getting HernanRodriguez\'s Tools...'
cd ~/Documents/Tools
git clone https://github.com/HernanRodriguez1/MimikatzFUD
git clone https://github.com/HernanRodriguez1/RevershellTCP_BypassAMSI


echo '[$$] Getting ***...'



echo '[$$] API Key Installation (for haxunit, subfinder, wpscan functionality)'
read -sp 'Enter Binaryedge API Key: ' Binaryedge_API_Key
read -sp 'Enter C99 API Key: ' C99_API_Key
read -sp 'Enter Certspotter (SSLmate) API Key: ' Certspotter_API_Key
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
echo 'binaryedge:
\t- $Binaryedge_API_Key
c99:
\t- $C99_API_Key
Certspotter:
\t- $Certspotter_API_Key
Censys:
\t- $Censys_API_ID
\t- $Censys_API_Secret
Chaos:
\t- $Chaos_API_Key
DnsDB:
\t- $DnsDB_API_Key
Fofa:
\t- $Fofa_API_Key
Github:
\t- $Github_API_Key
Intelx:
\t- $Intelx_API_Key
Passivetotal:
\t- $Passivetotal_API_Key
SecurityTrails:
\t- $SecurityTrails_API_Key
Seebug:
\t- $Seebug_API_Key
Shodan:
\t- $Shodan_API_Key
Spyse:
\t- $Spyse_API_Key
Virustotal:
\t- $Virustotal_API_Key
Zoomeye:
\t- $Zoomeye_API_Key
' > $HOME/.config/subfinder/provider-config.yaml

echo 'api_key $Certspotter_API_Key' > /etc/sslmate.conf


echo 'cli_options:\n\tapi_token: ${WPScan_API_Key}' > ~/.wpscan/scan.yml






exit
