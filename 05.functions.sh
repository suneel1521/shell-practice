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
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not instaled.....going to be installing"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo "nginx is already installed.....no need be change"
fi