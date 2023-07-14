#!/bin/sh

#Update the apt package index
sudo apt-get -y update

#Install packages to allow apt to use a repository over HTTPS
sudo -E apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
#Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo -E gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#set up the stable repository
echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo -E tee /etc/apt/sources.list.d/docker.list > /dev/null
  

#Update the apt package index
sudo apt-get -y update

#Install Docker Engine and containerd
sudo -E apt-get -y install docker-ce docker-ce-cli containerd.io

#If occur "sudo: add-apt-repository: command not found", run below command and then try install again
sudo -E apt-get -y install software-properties-common

#Enable Docker
sudo systemctl enable docker --now

#Install Docker Compose
sudo -E apt-get -y install docker-compose

#allow docker to run without sudo
sudo usermod -aG docker $(whoami)
sudo chmod 666 /var/run/docker.sock
sudo systemctl restart docker

