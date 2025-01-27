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

#
