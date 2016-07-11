#!/bin/bash

####################################################
###                                              ###
###   Basic script to delete one Docker image,   ###
###   all untagged images, or all images.        ###
###                                              ###
###   Usage:                                     ###
###      ./delete-images.sh all|untagged|${id}   ###
###                                              ###
####################################################


if [ $# -eq 0 ]
then
    # no arguments supplied
    echo "Missing argument"
    echo "Usage: ./delete-images.sh all|untagged|\${id}"
    echo "In the event you need an Image ID, review the following:"
    echo ""
    docker images
    exit 1
fi

if [ $1 == 'all' ]
then
    # delete ALL images
     docker rmi $(docker images | awk '{print $3}')
elif [ $1 == 'untagged' ]
then
    # delete all UNTAGGED images (those tagged with  "<none>")
    docker rmi $(docker images | grep "^<none>" | awk '{print $3}')
else
    # assume this is an ID and delete only the image noted
    docker rmi $1
fi
