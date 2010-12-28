# Set up Hoptoad
run "#{@rvm} exec rails generate hoptoad --api-key=#{orange_config['hoptoad_api_key'] || 'XXXX'}"