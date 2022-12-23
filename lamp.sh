#!/bin/bash

read -r -p "Installing LAMP, would you like to proceed? (y,n)" response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo 'Installing...'
else
    echo 'Installation cancelled'
    exit
fi

echo 'Updating system'
sudo apt update
echo 'Installing apache'
sudo apt install apache2
echo 'Enabling firewall'
sudo ufw enable
echo 'Allow incoming traffic for Apache port 80'
sudo ufw allow in "Apache"
echo 'Installing MySQL server'
sudo apt install mysql-server
sudo mysql -e 'ALTER USER `root`@`localhost` IDENTIFIED WITH mysql_native_password by "";flush privileges'
sudo mysql_secure_installation
echo 'Installing PHP'
sudo apt install php libapache2-mod-php php-mysql
echo 'Lamp installation complete!'
