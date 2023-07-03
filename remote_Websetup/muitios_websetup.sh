#!/bin/bash

# Declaring Vriabless #
#PACKAGE="wget unzip httpd"
#SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2102_constructive.zip"
ART_NAME="2102_constructive"
TEMP_DIR="/tmp/webfiles"


yum --help &> /dev/null

if [ $? -eq 0 ]
then
   # SET VARIABLES ON CENTOS
   PACKAGE="wget unzip httpd"
   SVC="httpd"
   echo "Running stup on CentOs"
   # Installing pacakges#
   echo "Installing Dependencies"
   echo "##################################################"
   sudo yum install $PACKAGE -y > /dev/null
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
   wget $URL
   unzip $ART_NAME.zip
   sudo cp -r $ART_NAME/* /var/www/html

   
   # Bounce Service
   echo "#################################################"
   echo "Restarting HTTPD Service"
   echo "#################################################"
   systemctl restart $SVC


   # Clean up
   echo "#################################################"
   echo "removing Temporary Files"
   echo "#################################################"
   rm -rf $TEMP_DIR
   echo


   sudo systemctl status $SVC
   ls /var/www/html

else
   # SET VARIABLES ON UBUNTU
   PACKAGE="wget unzip apache2"
   SVC="apache2"
   echo "Running stup on Ubuntu"
   # Installing pacakges#
   echo "Installing Dependencies"
   echo "##################################################"
   sudo apt update
   sudo apt install $PACKAGE -y > /dev/null
   echo

   #Start & Enable Service#
   echo "#################################################"
   echo "Start & Enable Apache2"
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
   echo "Download & Copy artifact to Apache2"
   echo "#################################################"
   wget $URL
   unzip $ART_NAME.zip
   sudo cp -r $ART_NAME/* /var/www/html


   # Bounce Service
   echo "#################################################"
   echo "Restarting Apache2 Service"
   echo "#################################################"
   systemctl restart $SVC


   # Clean up
   echo "#################################################"
   echo "removing Temporary Files"
   echo "#################################################"
   rm -rf $TEMP_DIR
   echo


   sudo systemctl status $SVC
   ls /var/www/html
fi
