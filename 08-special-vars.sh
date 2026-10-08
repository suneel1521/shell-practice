#!/bin/bash

echo "all variables passed in the script: $*"
echo "number of variables: $#"
echo "script name: $0"
echo "current directory: $PWD"
echo "user running the script: $USER"
echo "home directory: $HOME"
echo "pid of the script: $$"
sleep 10 &
echo " pid of last command to the background: $!"
