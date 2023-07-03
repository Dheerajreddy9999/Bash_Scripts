#!/bin/bash


echo "######################################################"
date
#ls /var/run/httpd/httpd.pid &> /dev/null

if [ -f /var/run/httpd/httpd.pid ]
then
   echo "Httpd process is running."
else
   echo "Httpd process is not running."
   echo "Starting the process"
   systemctl start httpd
   if [ $? -eq 0 ]
   then
      echo "Process started successfully."
   else
      echo "Process starting failed, Contact Admin."
   fi
fi
echo "######################################################"
echo
