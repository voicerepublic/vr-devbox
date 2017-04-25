#!/bin/bash

if ! (command -v ffmpeg >/dev/null 2>&1 && command -v sox >/dev/null 2>&1 \
          && command -v oggenc >/dev/null 2>&1 && command -v lame >/dev/null 2>&1)
then
    sudo cp /vagrant/templates/apt/sources.list.d/debmultimedia.list /etc/apt/sources.list.d/debmultimedia.list

    sudo apt-get update && sudo apt-get install -y --force-yes deb-multimedia-keyring

    sudo apt-get update
    sudo apt-get install -y sox vorbis-tools ffmpeg lame
    sudo ln -s /usr/bin/ffmpeg /usr/bin/avconv
fi
