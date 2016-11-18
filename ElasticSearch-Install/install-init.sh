#/bin/bash

#Install Dependency OpenJDK
sudo yum install java-1.8.0-openjdk

#Download Public Signing Key
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

#Adding RPM Repository
sudo cp ./elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

#Installing ElasticSearch
sudo yum install elasticsearch

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
