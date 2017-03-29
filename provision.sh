#!/bin/bash

echo 'deb http://ftp.debian.org/debian jessie-backports main' > \
     /etc/apt/sources.list.d/backports.list

apt-get update

apt-get install -y zsh i3 xinit roxterm git

# auto login
mkdir -p /etc/systemd/system/getty@tty1.service.d/
cat > /etc/systemd/system/getty@tty1.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin vagrant --noclear %I \$TERM
EOF

# zsh
chsh -s /usr/bin/zsh vagrant

# TODO move to file
cat >~vagrant/.zprofile <<EOF
autoload -Uz compinit promptinit
compinit
promptinit
export PROMPT='%~ %? %B%#%b '
EOF

# auto start x
echo '[ "$(tty)" = "/dev/tty1" ] && exec startx' >> ~vagrant/.zprofile

# setup vr
mkdir -p ~vagrant/src
ln -s /vagrant ~vagrant/src/vr

# generate key
if [ ! -f ~vagrant/.ssh/id_rsa ]; then
    su -c 'ssh-keygen -b 2048 -t rsa -f .ssh/id_rsa -N ""'
    echo
    echo '=== IMPORT THIS KEY TO GITHUB ==='
    echo
    echo 'https://github.com/settings/keys'
    echo "\n\n"
    ssh-keygen -y -f ~vagrant/.ssh/id_rsa
    echo
fi

# copy prepared files
cp -r /vagrant/home/* ~

# make sure everything is owned by user vagrant
chown -R vagrant: ~vagrant

# after provisioning reboot is often a good idea ;)
reboot
