#/bin/bash

#Installing Git
sudo yum -y install git unzip

#Removing repo if already exists
sudo rm -Rf ./Usefull-Scripts/

#Cloning Repo
git clone https://github.com/mdigiacomi/Usefull-Scripts.git

cd ./Usefull-Scripts/ApacheNutch-Install-RH

if [ -n "$JAVAHOME" ]; then
    echo "$JAVAHOME";

    sudo mkdir /home/apps/
    sudo cp ./Artifacts/* /home/apps/
    sudo cd /home/apps
    sudo unzip ./hbase-0.94.27.zip

else
    echo "\$JAVAHOME not set. Please Set JAVA_HOME Before Running Script";
fi
