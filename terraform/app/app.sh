#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y unzip wget curl git
sudo apt-get install -y apache2
sudo echo "welcome to my website $(hostname)" > /var/www/html/index.html