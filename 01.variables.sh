#!/bin/bash
USERID=$(id-u)
if [ $USERID -ne 0 ]
then
    echo "error :: please run the script with sudo access"
    exit 1
else
    echo "you are running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed.....going to installed"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "installing mysql.....success"
    else
        echo "mysql is not installed.....failure"
    exit 1
    f1
else
    echo "mysql is already installed nothing to do change"
fi
