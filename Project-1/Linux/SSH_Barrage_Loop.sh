#!/bin/bash
while :
do ssh sysadmin@10.0.0.5
    ssh sysadmin@10.0.0.6
    ssh sysadmin@10.0.0.7
    echo "Hit {CTRL+C} to stop!!!!"
done