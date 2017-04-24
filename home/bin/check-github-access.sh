#!/bin/bash

function error {
  echo -e "\033[31mERROR: $1\033[0m"
}

ssh -oStrictHostKeyChecking=no -T git@github.com
status=$?

if [ $status -eq 255 ]; then
    error "Connection to github refused!"
    echo '>'
    echo '> === IMPORT THIS KEY TO GITHUB ==='
    echo '>'
    echo '> https://github.com/settings/keys'
    echo '>'
    echo '>'
    ssh-keygen -y -f ~vagrant/.ssh/id_rsa
    echo '>'
    exit $status
fi
