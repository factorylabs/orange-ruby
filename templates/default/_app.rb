# Configure the main application

log "\n-- Processing app directory ...\n"

  # Tweak app layout to use HAML
  log "\n    Converting application layout in HAML ...\n"
  layout = <<-LAYOUT.gsub(/^ {4}/, '')
    !!!
    %html
      %head
        %title #{app_name.humanize}
        = stylesheet_link_tag :all
        = javascript_include_tag :defaults
        = csrf_meta_tag
      %body
        = yield
  LAYOUT

  remove_file "app/views/layouts/application.html.erb"
  create_file "app/views/layouts/application.html.haml", layout

  # Set up Configy
  log "\n    Setting up Configy ...\n"

  initializer 'configy.rb', <<-RUBY.gsub(/^ {4}/, '')
    # Use Configy (http://github.com/gvarela/configy) for application-wide configuration
    # Load application-specific configuration from config/config.yml.
    # Access the config params via ::Config
    Configy.create(:config)
  RUBY

  file 'config/config.yml', <<-RUBY.gsub(/^ {4}/, '')
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
  
  # Set up hacks initializer
  log "\n    Setting up hacks.rb ...\n"

  initializer 'hacks.rb', <<-RUBY.gsub(/^ {4}/, '')
    # Temporary patches, hacks, hotfixes, etc. go here.
    # Gives them a predictable place to live
  RUBY
  
  # Set up core extensions framework
  log "\n    Setting up core extensions ...\n"
  empty_directory 'lib/core_extensions'
  initializer 'core_extensions.rb', <<-RUBY.gsub(/^ {4}/, '')
    # Long-lived core extensions and patches can go in lib/core_extensions.  They will automatically be loaded here.
    core_extension_files = Rails.root.join('lib','core_extensions','*.rb')
    Dir.glob(core_extension_files).each do |path|
      require path
    end
  RUBY
  
  # Set up factory_girl
  log "\n    Setting up Factory Girl ...\n"
  file 'test/factories.rb', <<-RUBY.gsub(/^ {4}/, '')
    # Put your factory_girl factories in here
  RUBY
  
  # Set up Cucumber
  log "\n    Setting up Cucumber ...\n"
  run "#{@rvm} exec rails generate cucumber:install --testunit --capybara"

  # Set up generator defaults  
  log "\n    Setting up generator defaults ...\n"
  generators = <<-RUBY
    config.generators do |g|
        g.template_engine     :haml
        g.stylesheets         false  
        g.test_framework      :shoulda,     :fixture => false
        g.fixture_replacement :factory_girl
        g.integration_tool    :cucumber
      end
  RUBY
  application generators
  
  # Set up Newrelic
  log "\n    Setting up Newrelic ...\n"
  # TODO: Flesh this out.  Also, how do we pass the key while still keeping it private?
  
  # Set up Hoptoad
  log "\n    Setting up Hoptoad ...\n"
  # TODO: How to pass the API key while keeping it private?
  run "#{@rvm} exec rails generate hoptoad --api-key=XXXX"

  # Set up EY hooks files
  log "\n    Setting up EY Cloud deploy hooks ...\n"
  # TODO: Flesh this out.
  
  # Import cookbooks
  log "\n    Importing chef cookbooks ...\n"
  # TODO: Flesh this out.
  
  # Build a keypair
  log "\n    Creating a repo keypair ...\n"
  empty_directory 'config/keypair'
  run "/usr/bin/ssh-keygen -q -t rsa -f config/keypair/id_rsa"
  
  # Create example database.yml
  log "\n    Creating example database.yml ...\n"
  run "cp config/database.yml config/database.yml.example"

# Configure CI
log "\n-- Configuring application for CI ...\n"

  log "\n    Creating build.sh ...\n"
  # TODO: Implement me
