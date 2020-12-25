#!/bin/bash

# TODO: update so it can accept --api and --client as options
while getopts ":a:c:" opt; do
  case ${opt} in
    a ) 
        api=$OPTARG
        ;;
    c) 
        client=$OPTARG
        ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

# echo $api
# echo $client

# Create the API
output=`heroku create $api`
status=$?
echo $output
echo $status

while [ $status -ne 0 ]
do
    read -p "Please try a new name for the API: " api
    echo $api
    output=`heroku create $api`
    status=$?
    echo $output
done


# Create the client
output=`heroku create $client`
status=$?
echo $output
echo $status

while [ $status -ne 0 ]
do
    read -p "Please try a new name for the API: " client
    echo $client
    output=`heroku create $client`
    status=$?
    echo $output
done
