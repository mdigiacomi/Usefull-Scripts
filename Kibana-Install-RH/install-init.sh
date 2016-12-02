#/bin/bash

#Install Dependency OpenJDK
if type -p java; then
    echo "Java Installed"
else
    sudo yum -y install java-1.8.0-openjdk
fi


#Download Public Signing Key
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

#Adding RPM Repository
sudo cp ./kibana.repo /etc/yum.repos.d/kibana.repo

#Installing ElasticSearch
sudo yum -y install kibana

#Copy elasticsearch config
sudo cp ./kibana.yml /etc/kibana/kibana.yml

#Configure ElasticSearch to start automatically
sudo chkconfig --add kibana

#Start Elasticsearch Service
sudo -i service kibana start

#Set Firewall Port
sudo firewall-cmd --zone=public --add-port=5601/tcp --permanent
sudo firewall-cmd --reload

#Verify Port Open
sudo firewall-cmd --list-all
