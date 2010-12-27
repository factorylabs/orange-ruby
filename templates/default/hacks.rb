# Set up hacks initializer
log "\n    Setting up hacks.rb ...\n"

initializer 'hacks.rb', <<-RUBY.gsub(/^ {2}/, '')
  # Temporary patches, hacks, hotfixes, etc. go here.
  # Gives them a predictable place to live
RUBY