#!/bin/bash
 USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "please execute the script with root access"
   exit 1
else
   echo "you are running with root access"
fi

VALIDATE(){

    if [ $1 -eq 0 ]
    then
       echo "installing $2 is success"
    else
       echo "installing $2 is failure"
    fi   
}

PACKAGES=("mysql" "nginx" "python3" "httpd")

for package in "${PACKAGES[@]}"
do

dnf list installed $package

if [ $? -ne 0 ]
then
    echo " $package is not installed going to installing"
    dnf install $package -y
    VALIDATE $? "package"
else
    echo "$package is already installed"
  fi    
done
