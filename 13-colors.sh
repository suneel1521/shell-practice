#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
M="\e[35m"
N="\e[0m"


LOG_FOLDER="/var/log/shellscript_logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
   echo -e " $R ERROR: please execute the script with root access $N " &>> "$LOG_FILE"
   exit 1
else
   echo -e " $G you are running with root access $N "
fi


echo "script started executed at $(date)" &>> "$LOG_FILE"

VALIDATE(){

    if [ $1 -eq 0 ]
    then
       echo -e " $G $2 is installed.....successfully $N "  &>> "$LOG_FILE"
    else
       echo -e " $R $2 is install.....failure $N " &>> "$LOG_FILE"
       exit 1
    fi
}

dnf list installed nginx  &>> "$LOG_FILE"
if [ $? -ne 0 ]
then
   echo -e " $M nginx is not installed going to install $N " &>> "$LOG_FILE"
   dnf install nginx -y  &>> "$LOG_FILE"
   VALIDATE $? "nginx"  &>> "$LOG_FILE"
else
   echo -e " $Y nginx is already installed $N " &>> "$LOG_FILE"
fi

dnf list installed python3  &>> "$LOG_FILE"
if [ $? -ne 0 ]
then
   echo -e " $M python3 is not installed going to install $N "  &>> "$LOG_FILE"
   dnf install python3 -y &>> "$LOG_FILE"
   VALIDATE $? "python3"  &>> "$LOG_FILE"
else
   echo -e " $Y python3 is already installed $N "  &>> "$LOG_FILE"
fi