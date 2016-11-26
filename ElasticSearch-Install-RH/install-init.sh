#/bin/bash

#Install Dependency OpenJDK
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

#Copy elasticsearch config
cp ./elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

#Configure ElasticSearch to start automatically
chkconfig --add elasticsearch

#Start Elasticsearch Service
-i service elasticsearch start

#Set Firewall Port
firewall-cmd --zone=public --add-port=9200/tcp --permanent
firewall-cmd --reload

#Verify Port Open
firewall-cmd --list-all
