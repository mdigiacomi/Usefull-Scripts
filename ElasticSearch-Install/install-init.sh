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
sudo cp ./elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

#Installing ElasticSearch
sudo yum -y install elasticsearch

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
