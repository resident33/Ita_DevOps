#!/bin/bash

sudo su -

#Updating packages list
apt-get update

#Install packages
apt-get install -y dnsutils mc nmap htop mtr wget

#Install Chef client via URL
curl -L https://omnitruck.chef.io/install.sh | sudo bash
