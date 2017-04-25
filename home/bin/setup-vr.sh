#!/bin/bash

set -x

DIR="$(cd "$(dirname "$0")" && pwd)"


$DIR/check-github-access.sh || exit 1

$DIR/install-docker.sh
$DIR/install-java8.sh
$DIR/install-leinigen.sh

sudo apt-get install -y postgresql-client-9.4 libpq-dev nmap build-essential

$DIR/install-ruby-rbenv.sh
$DIR/install-node.sh
$DIR/install-multimedia.sh

if ! (groups | grep -q docker)
then
    echo "We are not part of the docker group yet, doing a reboot. Please run this script again after the reboot."
    echo "This might also be a good time to create a new snapshot!"
    echo "You can do this by running 'vagrant snapshot save YOURNAME'"
    sleep 10
    sudo reboot
fi

# setup db
docker run -d --name vr-postgres -p 5432:5432 -e POSTGRES_USER=app postgres

# setup rmq
docker run -d --name vr-rabbitmq -p 15672:15672 -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 25672:25672 rabbitmq:3.6.6-management

mkdir -p ~/src

git clone git@github.com:munen/voicerepublic_dev.git ~/src/dev

sed -e "s/your_username/app/" ~/src/dev/config/database.yml.example > ~/src/dev/config/database.yml

$DIR/update-ip-settings-local.sh

(cd ~/src/dev && \
    bundle && \
        rake db:create && \
        rake db:migrate)
