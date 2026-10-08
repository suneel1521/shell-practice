#!/bin/bash

USERID=$(id -u)

if [ $USERID -nq 0 ]
then
    echo "you are not a authorized user to running the script with root access"
    exit 1
else
    echo "you are running with root access"

VALIDATE(){
    if [ $1 -eq 0 ]
    then
       echo "installing $2 is.....success"
    else
       echo "installing $2 is.....failure"
       exit 1
}

dnf list installed mysql

if [ $? -nq 0 ]
then
   echo "mysql is not installed....going to be install"
   dnf install mysql -y
   VALIDATE $? "mysql"
else
   echo "mysql is alreday installed....nothing to do"