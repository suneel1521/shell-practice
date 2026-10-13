#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
N="\e[0m"

LOG_FOLDER=/var/log/shell_log
SCRIPT_NAME=$0

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo -e " $R ERROR:please execute the script with root access $N" | tee -a 
else
   echo "$B you are running with root access $N"
fi

echo "$M script executed at:$(date) $N"

VALIDATE(){

	if [ $1 -eq 0 ]
	then
	   echo "$G installed $2 successfully $N"
	else
	   echo "$R install $2 failure $N"
	fi
}

PACKAGES=("nginx" "python3" "mysql" "httpd")

for package in $"{PACKAGES[@]}"
do
  dnf list installed $package
  if [ $? -eq 0 ]
  then
      echo "$package is not installed going to install"
      dnf install $package -y
      VALIDATE $? "package"
  else
      echo "$Y $Ppackage is alreday installed ok $N "
  fi
done