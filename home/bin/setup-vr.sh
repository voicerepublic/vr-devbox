#!/bin/bash

set -x

./check-github-access.sh || exit 1

./install-docker.sh
./install-java8.sh
./install-leinigen.sh

sudo apt-get install -y postgresql-client-9.4 nmap build-essential

# setup db
docker run --name vr-postgres -p 5432:5432 -d postgres

# setup rmq
docker run -d --name vr-rabbitmq -p 15672:15672 -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 25672:25672 rabbitmq:3.6.6-management




# install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
~/.rbenv/bin/rbenv init
rbenv install 2.1.2
rbenv global 2.1.2
gem install bundler




mkdir -p ~/src

git clone git@github.com:munen/voicerepublic_dev.git ~/src/dev

cp src/dev/config/database.yml.sample src/dev/config/database.yml
cp src/dev/config/settings.local.yml.sample src/dev/config/settings.local.yml

(cd ~/src/dev && \
    bundle && \
        rake db:create && \
        rake db:migrate)
