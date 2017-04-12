#!/bin/bash


cp -f /vagrant/templates/apt/sources.list /etc/apt/sources.list
cp /vagrant/templates/apt/sources.list.d/backports.list /etc/apt/sources.list.d/backports.list

apt-get update

apt-get install -y zsh i3 xinit roxterm git wget build-essential

# auto login
mkdir -p /etc/systemd/system/getty@tty1.service.d/
cp /vagrant/templates/systemd/override.conf /etc/systemd/system/getty@tty1.service.d/override.conf

# zsh
chsh -s /usr/bin/zsh vagrant

# TODO move to file
cp -f /vagrant/templates/zsh/zprofile ~vagrant/.zprofile

# generate key
if [ ! -f ~vagrant/.ssh/id_rsa ]; then
    su -c 'ssh-keygen -b 2048 -t rsa -f .ssh/id_rsa -N ""'
    echo '>'
    echo '> === IMPORT THIS KEY TO GITHUB ==='
    echo '>'
    echo '> https://github.com/settings/keys'
    echo '>'
    echo '>'
    ssh-keygen -y -f ~vagrant/.ssh/id_rsa
    echo '>'
fi

# copy prepared files to ~vagrant
rsync -vr /vagrant/home/ /home/vagrant

chmod a+x /home/vagrant/bin/*

# make sure everything is owned by user vagrant
chown -R vagrant: ~vagrant

# after provisioning the first time reboot
if [ ! -f ~vagrant/.provisioned ]; then
    date > ~vagrant/.provisioned
    (sleep 5; reboot) &
fi
