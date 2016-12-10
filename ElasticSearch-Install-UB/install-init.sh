#/bin/bash

#Install Dependency OpenJDK
if type -p java; then
    echo "Java Installed"
else
    sudo apt-get -y install default-jdk
fi

#Download Public Signing Key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

#Adding RPM Repository
sudo cp ./elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

#Installing ElasticSearch
sudo apt-get install elasticsearch

#Copy elasticsearch config
sudo cp ./elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

#Configure ElasticSearch to start automatically
sudo chkconfig --add elasticsearch

#Start Elasticsearch Service
sudo -i service elasticsearch start

#Set Firewall Port
sudo firewall-cmd --zone=public --add-port=9200/tcp --permanent
sudo firewall-cmd --reload

#Verify Port Open
sudo firewall-cmd --list-all
