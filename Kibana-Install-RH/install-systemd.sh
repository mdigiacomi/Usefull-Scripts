#/bin/bash

#Install OpenJDK
if type -p java; then
    echo "Java Installed"
else
    sudo yum -y install java-1.8.0-openjdk
fi

#Download Public Signing Key
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

#Adding RPM Repository
sudo cp ./kibana.repo /etc/yum.repos.d/kibana.repo

#Installing Kibana
sudo yum -y install kibana

#Copy kibana config
sudo cp ./kibana.yml /etc/kibana/kibana.yml

#Configure Kibana to start automatically
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service

#Start Kibana Service
sudo systemctl start kibana.service

#Adding Firewall Rule
sudo firewall-cmd --zone=public --add-port=5601/tcp --permanent
sudo firewall-cmd --reload

#Checking Port is Open
sudo firewall-cmd --list-all
