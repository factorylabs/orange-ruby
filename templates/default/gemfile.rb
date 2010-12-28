# Configure gems
say "\n-- Processing Gemfile ...\n"

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
gem 'jquery-rails',                                     :group => [ :development ]
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