#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
M="\e[35m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e " $R you are not a authorized user to running the script with root access $N "
    exit 1
else
    echo -e "$M you are running with root access $N"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
       echo -e "installing $2 is.....$G success $N"
    else
       echo -e "installing $2 is.....$R failure $N"
       exit 1
    fi
}

dnf list installed nginx

if [ $? -ne 0 ]
then
   echo  "mysql is not installed....going to be install"
   dnf install nginx -y
   VALIDATE $? "mysql"
else
   echo -e " $Y mysql is alreday installed....nothing to do $N"
fi

dnf list installed python

if [ $? -ne 0 ]
then
   echo "python is not installed....going to be install"
   dnf install python -y
   VALIDATE $? "python"
else
   echo -e " $Y python is alreday installed....nothing to do $N"
fi