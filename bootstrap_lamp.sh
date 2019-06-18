#!/bin/bash

#Updating packages list
sudo yum update

#Install packages
sudo yum install -y net-tools dnsutils mc nmap htop mtr wget ctop git tree

# install required docker packages
echo -e "Install required packages"
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# add docker repository
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

#Install docker 18.6.1

echo -e "INSTALL DOCKER"
sudo yum update -y
sudo yum install -y docker-ce-18.06.1.ce docker-ce-cli-18.06.1.ce containerd.io --disableexcludes=docker

# Launch docker vithout sudo
sudo usermod -aG docker $(whoami)

sudo systemctl daemon-reload
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

#Install Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Install Chef client via URL
curl -L https://omnitruck.chef.io/install.sh | sudo bash

#Connect node to chef
ipaddr=$(ifconfig | sed -En 's/127.0.0.1//;s/172.17.*//;s/10.0.*//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
hostname=$(hostname)

sudo cp -R /vagrant/chef-repo/ ./
cd ./chef-repo/


sudo chef-client --chef-license accept

knife bootstrap --y $ipaddr --connect-user vagrant --sudo --ssh-identity-file /vagrant/.vagrant/machines/$hostname/virtualbox/private_key --node-name $hostname -r 'role[lampserv]'
