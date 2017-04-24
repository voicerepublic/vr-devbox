#!/bin/bash

if ! command -v docker >/dev/null 2>&1
then
    sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

    sudo apt-get update

    sudo apt-get install -y docker-ce
fi

# user might need to belong to the docker group
if ! groups | grep docker
then
    sudo usermod -aG docker $USER
fi
