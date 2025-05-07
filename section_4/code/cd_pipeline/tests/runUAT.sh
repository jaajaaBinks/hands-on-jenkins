#!/bin/bash

# set variables
hostname='localhost'
port=$1

# wait for the app to start
sleep 5 

# ping the app
# status_code=$(curl --write-out %{http_code} --o /dev/null --silent ${hostname}:${port})
status_code=$(curl --write-out "%{http_code}" -o NUL --silent ${hostname}:${port})

if [ -z $status_code ]; then
    echo "Error: status_code is empty"
    exit 1
fi

if [ $status_code == 200 ];
then
	echo "PASS: ${hostname}:${port} is reachable"
else
	echo "FAIL: ${hostname}:${port} is unreachable"
    exit 1
fi
