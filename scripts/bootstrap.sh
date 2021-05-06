#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
# (OPTIONAL)Download World Backup
# sudo aws s3api get-object --bucket BUCKET-NAME --key FILENAME /home/worlds.zip

#Nimdy Valheim Server Stuff
sudo apt-get install -y git net-tools awscli
cd /opt
git clone https://github.com/Nimdy/Dedicated_Valheim_Server_Script.git
cd Dedicated_Valheim_Server_Script/
sudo chmod +x menu.sh