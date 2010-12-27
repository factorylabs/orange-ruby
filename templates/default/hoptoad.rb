# Set up Hoptoad
log "\n    Setting up Hoptoad ...\n"
# TODO: How to pass the API key while keeping it private?
run "#{@rvm} exec rails generate hoptoad --api-key=XXXX"