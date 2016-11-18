#/bin/bash

#Install OpenJDK
sudo yum install java-1.8.0-openjdk

#Download Public Signing Key
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

#Adding RPM Repository
sudo cp ./elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

#Installing ElasticSearch
sudo yum install elasticsearch

#Update ElasticSearch Config
sudo cp ./elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

#Configure ElasticSearch to start automatically
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service

#Start Elasticsearch Service
sudo systemctl start elasticsearch.service

#Adding Firewall Rule
sudo firewall-cmd --zone=public --add-port=9200/tcp --permanent
sudo firewall-cmd --reload

#Checking Port is Open
sudo firewall-cmd --list-all
