#!/bin/bash

# FIXME this is not idempotent!
sudo sed -i 's/main/main contrib non-free/' /etc/apt/sources.list

sudo apt-get update

sudo apt-get install -y java-package

wget --no-check-certificate -c \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gzhttp://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz

make-jpkg jdk-8u112-linux-x64.tar.gz

sudo dpkg -i oracle-java8-jdk_8u121_amd64.deb
