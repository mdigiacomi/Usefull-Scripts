#/bin/bash

#Installing Git
sudo yum -y install git

#Cloning Repo
git clone https://github.com/mdigiacomi/Usefull-Scripts.git

#Executing Installation
cd ./Useful-Bash/ElasticSearch-Install/

#Checking it System uses init or systemd and running apropriate script
pidof /sbin/init && sudo bash ./install-init.sh > output.log || sudo bash install-systemd.sh > output.log
