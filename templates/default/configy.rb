say "Setting up Configy ..."

initializer 'configy.rb', <<-RUBY.gsub(/^ {2}/, '')
  # Use Configy (http://github.com/gvarela/configy) for application-wide configuration
  # Load application-specific configuration from config/config.yml.
  # Access the config params via ::Config
  Configy.create(:config)
RUBY

file 'config/config.yml', <<-RUBY.gsub(/^ {2}/, '')
  # Use Configy (http://github.com/gvarela/configy) for application-wide configuration settings
  # These get loaded by config/initializers/configy.rb and can be accessed via ::Config

  # Define settings for all environments here
  common:

  # For example:
  # superuser: mfischer
  # per_page: 20
  # array_of_arrays:
  #   - [key, val]
  #   - [key2, val2]
  
  # Define settings for specific environments here:
  
  development:
  
  test:
  
  demo:
  
  production:
  
RUBY
