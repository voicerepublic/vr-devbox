#!/bin/bash

if [ -d ~/src/dev ]
then
    IP=`ip route get 1 | awk '{print $NF;exit}'`
    sed -e "s/192.168.178.21/$IP/" ~/src/dev/config/settings.local.yml.sample > ~/src/dev/config/settings.local.yml
fi
