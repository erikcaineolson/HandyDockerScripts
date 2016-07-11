#!/bin/bash

###############################################
###                                         ###
###   Basic script to delete one or more    ###
###   Docker containers.                    ###
###                                         ###
###   Usage:                                ###
###      ./delete-containers.sh all|${id}   ###
###                                         ###
###############################################


if [ $# -eq 0 ]
then
    # no arguments supplied
    echo "Missing argument"
    echo "Usage: ./delete-containers.sh all|\${id}"
    echo "In the event you need a Container ID, reference the following:"
    echo ""
    docker ps -a
    exit 1
fi

if [ $1 == 'all' ]
then
    # delete ALL containers
    docker ps -q -a | xargs docker rm
else
    # assume this is an ID and delete only the container noted
    docker rm $1
fi
