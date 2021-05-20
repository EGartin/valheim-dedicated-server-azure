#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

#Nimdy Valheim Server Stuff
sudo apt-get install -y git net-tools
cd /opt
git clone https://github.com/Nimdy/Dedicated_Valheim_Server_Script.git
cd Dedicated_Valheim_Server_Script/
sudo chmod +x menu.sh