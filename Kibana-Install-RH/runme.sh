#/bin/bash

#Installing Git
sudo yum -y install git

#Removing repo if already exists
sudo rm -Rf ./Usefull-Scripts/

#Cloning Repo
git clone https://github.com/mdigiacomi/Usefull-Scripts.git

cd ./Usefull-Scripts/Kibana-Install-RH

#Checking it System uses init or systemd and running apropriate script
if pidof /sbin/init; then 
    sudo bash ./install-systemd.sh
else
    sudo bash ./install-init.sh
fi