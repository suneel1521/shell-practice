#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error :: Please run the script with sudo access"
    exit 1
else
    echo "You are running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed.....going to install"

    dnf install mysql -y

    if [ $? -eq 0 ]
    then
        echo "Installing MySQL.....success"
    else
        echo "MySQL installation.....failure"
        exit 1
    fi
else
    echo "MySQL is already installed, nothing to do"
fi