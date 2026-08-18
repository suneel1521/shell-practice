#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR:you cannot proceed please login root access"
    exit 1
else
    echo "you have a root access"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not instaled.....going to be installing"
    dnf install nginx -y
    if [ $? -eq 0 ]
    then
        echo "nginx installed.....successuful"
    else
        echo "nginx installing.....failure"
    fi
else
    echo "nginx is already installed.....no need be change"
fi