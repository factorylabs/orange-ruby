#!/bin/bash
# RVM
source ~/.profile
rvm use ree@orange-ruby --create

# Bundle
gem install bundler -v 1.0.0 --no-ri --no-rdoc && \
bundle install --deployment && \

# Tests
bundle exec cucumber