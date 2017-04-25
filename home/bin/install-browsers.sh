#!/bin/bash

sudo cp /vagrant/templates/apt/sources.list.d/firefox.list /etc/apt/sources.list.d/firefox.list
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 3EE67F3D0FF405B2

sudo apt-get update
sudo apt-get -y install chromium firefox
