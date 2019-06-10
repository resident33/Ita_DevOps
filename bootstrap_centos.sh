#!/bin/bash

sudo su -

#Updating packages list
yum update -y

#Install package 
yum install -y bind-utils net-tools mc htop mtr wget nano git

#Install Chef client via URL
curl -L https://omnitruck.chef.io/install.sh | sudo bash

