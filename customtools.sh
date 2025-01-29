#!/bin/bash

#Update and Upgrade
sudo apt-get update
sudo apt-get upgrade

#add /opt ownership to kali user
sudo chown -R kali:kali /opt

#Sublime Text Install
sudo apt-get install apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

#rlwrap to enable arrow key function on a reverse
sudo apt-get install rlwrap

#Recon Tools

#ReconSpider from HTB, extracts links, comments, subdomains and other juicy information from the html code of the page.
mkdir /opt/recon
curl https://academy.hackthebox.com/storage/modules/144/ReconSpider.v1.2.zip -o /opt/recon/ReconSpider.zip
unzip /opt/recon/ReconSpider.zip -d /opt/recon/

#FinalRecon - fast and simple Python script for web reconnaissance
sudo apt-get install finalrecon

#useful github repositiories
#Penelope is a shell handler designed to be easy to use and intended to replace netcat when exploiting RCE vulnerabilities. It is compatible with Linux and macOS and requires Python 3.6 or higher. It is a standalone script using only Python's native library, and it is intended to remain this way.
mkdir /opt/privesc
cd /opt/privesc

git clone https://github.com/brightio/penelope.git
#PEASS privesc
wget https://github.com/peass-ng/PEASS-ng/releases/download/20250126-41ed0f6a/linpeas.sh

#port-forwarding tools
#chisel
wget https://github.com/jpillora/chisel/releases/download/v1.10.1/chisel_1.10.1_linux_amd64.gz
wget https://github.com/jpillora/chisel/releases/download/v1.10.1/chisel_1.10.1_windows_amd64.gz

#ligolo-ng
#agent
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.5/ligolo-ng_agent_0.7.5_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.5/ligolo-ng_agent_0.7.5_windows_amd64.zip

#proxy
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.5/ligolo-ng_proxy_0.7.5_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.5/ligolo-ng_proxy_0.7.5_windows_amd64.zip

#A tool to change grafana hash to hashcat crackable format
git clone https://github.com/iamaldi/grafana2hashcat.git # save hash in this format 'hash, salt' > hash.txt | hashcat -m 10900 -a 0 bigbang.grafanahashcat.hashes /opt/Passwords/rockyou.txt

#Windows Binaries and Active Directory Tools
mkdir /opt/windows/AD
cd /opt/windows/AD

curl https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -o kerbrute_linux_amd64
curl https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_windows_amd64.exe -o kerbrute_windows_amd64.exe

git clone https://github.com/Flangvik/SharpCollection.git

#Installing neo4j for graph support and bloodhound
sudo apt-get install neo4j
sudo apt-get install bloodhound

#Installinf impacket tools
sudo apt-get install python3-impacket



