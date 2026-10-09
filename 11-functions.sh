#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you are not a authorized user to running the script with root access"
    exit 1
else
    echo "you are running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
       echo "installing $2 is.....success"
    else
       echo "installing $2 is.....failure"
       exit 1
    fi
}

dnf list installed nginx

if [ $? -ne 0 ]
then
   echo "mysql is not installed....going to be install"
   dnf install nginx -y
   VALIDATE $? "mysql"
else
   echo "mysql is alreday installed....nothing to do"
fi