#!/bin/bash

read -r -p "Would you like to install Wordpress? (y,n)" response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    sudo apt-get install wget
    sudo apt-get install unzip
    sudo wget https://wordpress.org/latest.zip
    sudo unzip latest.zip
    sudo rm -rf /var/www/html/*
    sudo cp -r wordpress/* /var/www/html/
    sudo rm -rf latest.zip
    sudo rm -rfd wordpress
    echo 'Successfully installed Wordpress! The Wordpress interface will take it from here.'
    echo 'Open this URL in a web browser: localhost/wp-admin'
else
    exit
fi

