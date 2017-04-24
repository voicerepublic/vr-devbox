#!/bin/bash

# install rbenv
if ! (echo "$PATH" | grep -q "$HOME\/\.rbenv\/bin")
then
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(rbenv init - $SHELL)"' >> ~/.zshrc
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init - $SHELL)"

    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# install ruby dependencies
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev
rbenv install -s 2.1.2
rbenv global 2.1.2
gem install bundler
