#!/bin/bash


if ! dpkg -s oracle-java8-set-default > /dev/null 2>&1
then

    sudo cp /vagrant/templates/apt/sources.list.d/java.list /etc/apt/sources.list.d/java.list
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

    sudo apt-get update

    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
    echo oracle-java8-installer shared/accepted-oracle-licence-v1-1 boolean true | sudo /usr/bin/debconf-set-selections

    echo oracle-java8-set-default shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
    echo oracle-java8-set-default shared/accepted-oracle-licence-v1-1 boolean true | sudo /usr/bin/debconf-set-selections

    sudo apt-get -y install oracle-java8-set-default
fi
