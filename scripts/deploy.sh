#!/bin/bash

# Current path
CURRENT_PATH=`cd /home/pi`

# Clone the repo
git clone https://github.com/LanderU/ProyectoDAM

#Install nodejs
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt install nodejs
sudo npm install express

# Create systemd service

sudo mv $CURRENT_PATH/ProyectoDAM/systemd/bot.service /lib/systemd/system/
sudo mv $CURRENT_PATH/ProyectoDAM/scripts/start.sh /home/pi/

# Enable the servicd
sudo systemctl enable bot.service
sudo sytemctl start bot.service

# Bot running
whiptail --title "Correcto" --msgbox "Tu bot está en marcha" 8 78

