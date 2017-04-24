#!/bin/bash

if ! (command -v node >/dev/null 2>&1)
then
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi
