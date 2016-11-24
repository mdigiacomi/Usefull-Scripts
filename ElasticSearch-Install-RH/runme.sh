#/bin/bash

#Installing Git
sudo yum -y install git

#Cloning Repo
git clone https://github.com/mdigiacomi/Usefull-Scripts.git

#Checking it System uses init or systemd and running apropriate script
pidof /sbin/init && sudo bash ./Usefull-Scripts/ElasticSearch-Install-RH/install-init.sh > output.log || sudo bash ./Usefull-Scripts/ElasticSearch-Install-RH/install-systemd.sh > output.log
