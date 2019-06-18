#!/bin/bash

sudo su -

#Updating packages list
yum update -y

#Install package 
yum install -y bind-utils net-tools mc htop mtr wget nano git

#Install Chef client via URL
curl -L https://omnitruck.chef.io/install.sh | sudo bash

#Connect node to chef
ipaddr=$(ifconfig | sed -En 's/127.0.0.1//;s/172.17.*//;s/10.0.*//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
hostname=$(hostname)

cp -R /vagrant/chef-repo/ ./
cd ./chef-repo/

chef-client --chef-license accept

knife bootstrap --y $ipaddr --connect-user vagrant --sudo --ssh-identity-file /vagrant/.vagrant/machines/$hostname/virtualbox/private_key --node-name $hostname$((RANDOM%100)) -r 'role[webserv]'

