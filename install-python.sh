#bin/bash

sudo apt update

#Download Repo
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

#install Python
sudo apt-get -y install python3-pip

#Install pip after install python
python3 get-pip.py yes
