log "\nFDL Rails 3 template\n"
log "\nDetails at http://github.com/factorylabs/templates\n"

# Configure gems
log "\n-- Processing Gemfile ...\n"

  ## Basic Gems
  gem 'bundler',            '1.0.7'
  gem 'rails',              '3.0.3'
  gem 'thin',                         :require => false
  gem 'mysql2'
  gem 'haml-rails'
  gem 'formtastic'
  gem 'jammit'
  gem 'configy'
  gem 'newrelic_rpm',                 :require => false
  gem 'rpm_contrib'
  gem 'hoptoad_notifier'

  ## Development gems
  gem 'annotate'
  gem 'engineyard',                   :require => false,  :group => [ :development ]
  gem 'db-entropy',                   :require => false
  gem 'ruby-debug',                                       :group => [ :development, :test ]
  gem 'rake-hooks',                   :require => false,  :group => [ :development ]
  gem 'factory_girl_generator',                           :group => [ :development, :test]

  ## Test Gems
  gem 'evergreen',                    :require => 'evergreen/rails'

  # This should not be required because it screws with webdriver.  It gets explicitly required in test_helper.rb
  gem 'fakeweb',                      :require => false,  :group => [ :test ]
  gem 'timecop',                                          :group => [ :test ]
  gem 'shoulda',                                          :group => [ :test ]
  gem 'mocha',                                            :group => [ :test ]
  gem 'factory_girl_rails',                               :group => [ :test ]
  gem 'capybara',                                         :group => [ :test ]
  gem 'database_cleaner',                                 :group => [ :test ]
  gem 'cucumber-rails',                                   :group => [ :test ]
  gem 'launchy',                                          :group => [ :test ]


# Configure RVM
log "\n-- Processing RVM ...\n"

  ## Use REE and an app-specific gemset
  desired_ruby  = 'ree'
  gemset_name   = app_name

  # Let us run shell commands inside our new gemset. Use this in other template partials.
  @rvm = "rvm #{desired_ruby}@#{gemset_name}"

  # Create .rvmrc
  log "\n    Creating default .rvmrc ...\n"
  create_file ".rvmrc", @rvm

  # Make the .rvmrc trusted
  run "rvm rvmrc trust #{@app_path}"

  # Since the gemset is likely empty, manually install bundler so it can install the rest
  log "\n    Install bundler ...\n"
  run "#{@rvm} gem install bundler -v 1.0.7 --no-ri --no-rdoc"

  # Install all other gems needed from Gemfile
  log "\n    Install Gemfile gems ...\n"
  run "#{@rvm} exec bundle install"

  # Cache bundled gems for deployment
  log "\n    Package Gemfile gems ...\n"
  run "#{@rvm} exec bundle package"
  

# Tweak the Public directory
log "\n-- Processing public directory ...\n"

  # Remove files we don't care about
  log "\n    Removing unnecessary files ...\n"
  remove_file "README"
  remove_file "public/index.html"
  remove_file "public/favicon.ico"
  remove_file "public/robots.txt"
  remove_file "public/index.html"
  remove_file "public/images/rails.png"

  # Create a sane robots.txt
  log "\n    Creating a default robots.txt ...\n"
  robots_txt = <<-ROBOTS.gsub(/^ {4}/, '')
    # See http://www.robotstxt.org/wc/norobots.html for documentation on how to use the robots.txt file
    #
    User-Agent: *
    Disallow: /admin

  ROBOTS

  create_file "public/robots.txt", robots_txt

  # Remove Prototype
  log "\n    Removing Prototype ...\n"
  remove_file "public/javascripts/controls.js"
  remove_file "public/javascripts/dragdrop.js"
  remove_file "public/javascripts/effects.js"
  remove_file "public/javascripts/prototype.js"
  remove_file "public/javascripts/rails.js"

  # Add jQuery
  log "\n    Adding jQuery ...\n"
  empty_directory 'public/javascripts/jquery'
  get "http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js",  "public/javascripts/jquery/jquery.js"
  get "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js", "public/javascripts/jquery/jquery-ui.js"
  `curl http://github.com/rails/jquery-ujs/raw/master/src/rails.js -o public/javascripts/jquery/rails.js`
  gsub_file 'config/application.rb', 'config.action_view.javascript_expansions[:defaults] = %w()', 'config.action_view.javascript_expansions[:defaults] = %w(jquery/jquery.js jquery/jquery-ui.js jquery/rails.js)'

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

# Initialize Git repository
log "\n-- Initializing Git repository ...\n"

  create_file "log/.gitkeep"
  create_file "tmp/.gitkeep"

  # Create a .gitignore file and a new local repository, commit everything
  log "\n    Creating .gitignore ...\n"
  remove_file '.gitignore'
  file '.gitignore', <<-CODE.gsub(/^ {4}/, '')
    # System stuff
    .DS_Store
    .bundle
    .idea
    .rake_tasks
    REVISION
    vendor/bundle
    .rake_tasks~
    mkmf.log
  
    # Local config files
    config/database.yml
    config/*.sphinx.conf
    config/mongoid.yml

    # Local DBs
    db/sphinx
    db/*.sqlite3

    # Logs
    log/*.log
    log/*.pid

    # Tempfiles
    tmp/**/*
    coverage
    capybara*
  
    # Assets
    public/system
    public/static
    /assets
    packages
  CODE
  
  # Do the initial commit
  log "\n    Creating the repo  ...\n"

  git :init
  git :add => "."
  git :commit => "-am 'Initial commit.'"
  
  # Push to Github
  # TODO: implement me


# Final housekeeping

docs = <<-DOCS
\nTemplate run is complete.  Please run the following to complete the setup of #{app_name.humanize}:
- Add your API key to config/intializers/hoptoad.rb
- Import your config/newrelic.yml
DOCS

log docs
