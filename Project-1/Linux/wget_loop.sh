#!/bin/bash
input="webIPs.txt"
while :
do wget -i webIPs.txt -O /dev/null
    echo "Hit {CTRL+C} to stop!"
done