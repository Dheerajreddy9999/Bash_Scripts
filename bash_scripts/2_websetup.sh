#!/bin/bash

sudo yum install wget unzip httpd -y

sudo systemctl start httpd
sudo systemctl enable httpd

mkdir -p /tmp/webfiles
cd /tmp/webfiles

wget https://www.tooplate.com/zip-templates/2102_constructive.zip
unzip 2102_constructive.zip
sudo cp -r 2102_constructive/* /var/www/html

systemctl restart httpd


rm -rf /tmp/webfiles
