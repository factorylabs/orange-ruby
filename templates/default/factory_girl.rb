# Set up factory_girl
log "\n    Setting up Factory Girl ...\n"
file 'test/factories.rb', <<-RUBY.gsub(/^ {2}/, '')
  # Put your factory_girl factories in here
RUBY
