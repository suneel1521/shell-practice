#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
M="\e[35m"
N="\e[0m"


USERID=$(id -u)
if [ $USERID -ne 0 ]
then
   echo -e " $R ERROR: please execute the script with root access $N "
   exit 1
else
   echo -e " $G you are running with root access $N "
fi


VALIDATE(){

    if [ $1 -eq 0 ]
    then
       echo -e " $G $2 is installed.....successfully $N "
    else
       echo -e " $R $2 is install.....failure $N "
       exit 1
    fi
}

dnf list installed nginx
if [ $? -ne 0 ]
then
   echo -e " $M nginx is not installed going to install $N "
   dnf install nginx -y
   VALIDATE $? "nginx"
else
   echo -e " $Y nginx is already installed $N "
fi

dnf list installed python3
if [ $? -ne 0 ]
then
   echo -e " $M python3 is not installed going to install $N "
   dnf install python3 -y
   VALIDATE $? "python3"
else
   echo -e " $Y python3 is already installed $N "
fi