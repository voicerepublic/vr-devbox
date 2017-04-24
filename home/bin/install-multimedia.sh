#!/bin/bash

if ! (command -v ffmpeg >/dev/null 2>&1)
then
    sudo cp /vagrant/templates/apt/sources.list.d/debmultimedia.list /etc/apt/sources.list.d/debmultimedia.list

    sudo apt-get update && sudo apt-get install -y deb-multimedia-keyring

    sudo apt-get update
    sudo apt-get install -y sox vorbis-tools ffmpeg
    sudo ln -s /usr/bin/ffmpeg /usr/bin/avconv
fi
