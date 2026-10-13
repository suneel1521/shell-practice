#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:please execute the script with root access"
else
   echo "you are running with root access"
fi

echo "script executed at:$(date)"

VALIDATE(){

	if [ $1 -eq 0 ]
	then
	   echo "$PACKAGES is installed successfully"
	else
	   echo "$PACKAGES is install failure"
	fi
}

PACKAGES=("nginx" "python3" "mysql" "httpd")

dnf list installed $PACKAGES
if [ $? -eq 0 ]
then
   echo "$PACKAGES is not installed going to install"
   dnf install $PACKAGES -y
   VALIDATE $? "$PACKAGES"
else
   echo "$PACKAGES is alreday installed ok "
fi