#!/bin/bash
sudo apt-get update
sudo apt-get-y dist-upgrade
# Installing Tools to allow for live backups of Ubuntu VMs 
sudo apt-get install -y --install-recommends linux-virtual-lts-xenial
sudo apt-get install -y --install-recommends linux-tools-virtual-lts-xenial linux-cloud-tools-virtual-lts-xenial
