#!/bin/bash
 
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR : this user has enough permissions enable root access to run script"
    exit 1
else
    echo "you are running with root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed.....now getting installing"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "mysql installed.....successfully"
    else
        echo "mysql installed.....failure"
    fi
else
    echo "mysql is already installed.....no need to change it"
fi
