#!/bin/bash

awk -F '{print $1, $2, $3, $3, $4, $5, $6, $7, $8}' | grep "$1" "$2" 

