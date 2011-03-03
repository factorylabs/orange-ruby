#!/bin/bash

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
	
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"

else

  printf "ERROR: An RVM installation was not found.\n"

fi

# Setup the gemset
rvm get head && \
rvm reload && \
rvm use ree@orange_ruby --create && \
rvm --force gemset empty && \
rvm rubygems current

# Add the homebrew path
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# REE Tweaks
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# Setup bundler
gem install bundler -v 1.0.10 --no-ri --no-rdoc
bundle install

# Tests
bundle exec cucumber