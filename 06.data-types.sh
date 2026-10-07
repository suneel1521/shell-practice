#!/bin/bash

NUMBER1=100
NUMBER2=400

TIMESTAMP=$(date) # it executes the date and time and stores in timestamp
echo "script executed at in:: $TIMESTAMP"

SUM=$((NUMBER1+$NUMBER2))
echo sum od $NUMBER1 and $NUMBER2 is $SUM