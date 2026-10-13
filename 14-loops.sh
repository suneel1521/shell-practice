#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
N="\e[0m"

LOG_FOLDER=/var/log/shell_log
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo -e " $R ERROR:please execute the script with root access $N" | tee -a "$LOG_FILE"
   exit 1
else
   echo -e "$B you are running with root access $N" | tee -a "$LOG_FILE"
fi

echo -e "$M script executed at:$(date) $N" | tee -a "$LOG_FILE"

mkdir $LOG_FOLDER

VALIDATE(){

	if [ $1 -eq 0 ]
	then
	   echo -e "$G installed $2 successfully $N" | tee -a "$LOG_FILE"
	else
	   echo -e "$R install $2 failure $N" | tee -a "$LOG_FILE"
	fi
}

PACKAGES=("nginx" "python3" "mysql" "httpd")

for package in "${PACKAGES[@]}"
do
  dnf list installed $package $>>"$LOG_FILE"
  if [ $? -eq 0 ]
  then
      echo -e "$package is not installed going to install" | tee -a "$LOG_FILE"
      dnf install $package -y $>>"$LOG_FILE"
      VALIDATE $? "$package"
  else
      echo -e "$Y $package is alreday installed ok $N " | tee -a "$LOG_FILE"
  fi
done