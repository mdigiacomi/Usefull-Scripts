#/bin/bash

#Install OpenJDK
if type -p java; then
    echo "Java Installed"
else
    yum -y install java-1.8.0-openjdk
fi

#Download Public Signing Key
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

#Adding RPM Repository
cp ./elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

#Installing ElasticSearch
yum -y install elasticsearch

#Update ElasticSearch Config
cp ./elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

#Configure ElasticSearch to start automatically
/bin/systemctl daemon-reload
/bin/systemctl enable elasticsearch.service

#Start Elasticsearch Service
systemctl start elasticsearch.service

#Adding Firewall Rule
firewall-cmd --zone=public --add-port=9200/tcp --permanent
firewall-cmd --reload

#Checking Port is Open
firewall-cmd --list-all
