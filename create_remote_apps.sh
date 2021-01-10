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

# Confirm if API name is unspecified
if [ -z "${api}" ]; then
    read -p "Are you sure you want a random name for the API? y/n: " ans
    if [ "${ans}" != "y" ]; then
        echo "Please rerun the command with -a to specify the API name"
        exit 0
    fi
fi

# Confirm if client name is unspecified
if [ -z "${client}" ]; then
    read -p "Are you sure you want a random name for the React web client? y/n: " ans
    if [ "${ans}" != "y" ]; then
        echo "Please rerun the command with -c to specify the React web client name"
        exit 0
    fi
fi

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
    read -p "Please try a new name for the React web client: " client
    echo $client
    output=`heroku create $client`
    status=$?
    echo $output
done

# API set up in heroku
heroku config:set -a $api PROCFILE=api/Procfile
heroku buildpacks:add -a $api heroku/python
heroku buildpacks:add -a $api https://buildpack-registry.s3.amazonaws.com/buildpacks/heroku-community/multi-procfile.tgz

remoteName=heroku-api
git remote add $remoteName https://git.heroku.com/$api.git
git push $remoteName master

# Client set up in heroku
heroku config:set -a $client REACT_APP_API_URL=https://$api.herokuapp.com
heroku config:set -a $client APP_BASE=./client
heroku buildpacks:add -a $client mars/create-react-app
heroku buildpacks:add -a $client https://github.com/lstoll/heroku-buildpack-monorepo -i 1

clientRemoteName=heroku-client
git remote add $clientRemoteName https://git.heroku.com/$client.git
git push $clientRemoteName master
