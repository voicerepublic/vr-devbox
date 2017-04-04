# clone the main vr repo
git clone git@github.com:munen/voicerepublic_dev.git

# install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# add to your path...
# for bash:
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
# for zsh:
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
~/.rbenv/bin/rbenv init

# install ruby-build
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# install debian packages:
sudo apt-get install postgresql-contrib libpcre++-dev libav-tools sox vorbis-tools libreadline-dev libpq-dev

# install bundler
gem install bundler

# install capistrano
gem install capistrano

#  run bundle
bundle

# install docker
# from: https://github.com/munen/voicerepublic_dev/blob/integration/lib/icecast/README.md
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# this throws errors, I had to actually manually create the file and paste the line:
echo 'deb https://apt.dockerproject.org/repo debian-jessie main' > /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get -y install docker-engine psmisc

# user might need to belong to the docker group
sudo usermod -aG docker vagrant
# then reboot
reboot

# start docker db
docker run --name vr-postgres -p 5432:5432 -d postgres
psql -h localhost -U postgres
# password: 
CREATE DATABASE vr_dev;                                                                                                                                                                                                                            
CREATE DATABASE vr_test;