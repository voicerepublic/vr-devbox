#!/bin/bash

# sudo wget -O /var/cache/apt/archives/atom-amd64.deb \
#      https://github.com/atom/atom/releases/download/v1.15.0/atom-amd64.deb
# sudo apt-get install atom

wget -O /tmp/atom.deb \
     https://github.com/atom/atom/releases/download/v1.15.0/atom-amd64.deb

sudo dpkg -i /tmp/atom.deb

sudo apt-get install -y -f

rm /tmp/atom.deb

atom
