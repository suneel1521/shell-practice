#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR:you cannot proceed please login root access"
    exit 1
else
    echo "you have a root access"
fi
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "installed $2.....successuful"
    else
        echo "installing $2.....failure"
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not instaled.....going to be installing"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo "mysql is already installed.....no need be change"
fi

dnf list installed nginx
if [ $? -eq 0 ]
then
    echo "nginx is not installed.....going to be installed"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed.....no need to be change"
fi

dnf list installed mongodb.org
if [ $? -eq 0 ]
then
    echo "nginx is not installed.....going to be installed"
    dnf install mongobd.org -y
    VALIDATE $? "mongodb"
else
    echo "mongodb is already installed.....no need to be change"
fi