#/bin/bash

#Installing Git
sudo yum -y install git

#Cloning Repo
git clone https://github.com/mdigiacomi/Usefull-Scripts.git

cd ./Usefull-Scripts/ElasticSearch-Install-RH

#Checking it System uses init or systemd and running apropriate script
if pidof /sbin/init; then 
    sudo bash ./install-systemd.sh
else
    sudo bash ./install-init.sh
fi