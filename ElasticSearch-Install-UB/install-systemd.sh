#/bin/bash

#Install OpenJDK
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
