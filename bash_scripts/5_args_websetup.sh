#!/bin/bash

# Declaring Vriabless #
PACKAGE="wget unzip httpd"
SVC="httpd"
#URL="https://www.tooplate.com/zip-templates/2102_constructive.zip"#
#ART_NAME="2102_constructive"#
TEMP_DIR="/tmp/webfiles"



# Installing pacakges#

echo "Installing Dependencies"
echo "##################################################"
sudo yum install $PACKAGE -y
echo

#Start & Enable Service#
echo "#################################################"
echo "Start & Enable HTTPD(Apache)"
echo "#################################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo


# Creating Temp Directory #
echo "#################################################"
echo "Strting Artifact Deployment"
echo "#################################################"
mkdir -p $TEMP_DIR
cd $TEMP_DIR
echo


# Download& Unzip the package #
echo "#################################################"
echo "Download & Copy artifact to Httpd"
echo "#################################################"
wget $1
unzip $2.zip
sudo cp -r $2/* /var/www/html

systemctl restart $SVC


rm -rf $TEMP_DIR
