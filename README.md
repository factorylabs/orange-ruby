Factory Labs - Rails 3 Templates
================================

# Credits
Originally forked from https://github.com/leshill/rails3-app with additions from https://github.com/greendog99/greendog-rails-template - not a lot of resemblance to either one anymore, however.

Right now, only one template (default) exists - more will probably come along, however.

What's included in the default template?
----

The TL;DR version:  test:unit, shoulda, factory_girl, capybara, evergreen, haml, engineyard, mysql2, and formtastic.  Read on for more details.

### RVM
A new .rvmrc is created for the application, and set to be trusted automatically. We use REE for all of our production deployments because it's stable and blazing fast, to the rvmrc defaults to that interpreter.  A new gemset is also created just for the new application.

### Bundler
Bundler 1.0.7 is installed by default, and gems are cached into vendor by default.

### Gems/Gemfile
We install a bunch of gems automatically.  Here's the list:

### General
* bundler (1.0.7)
* rails (3.0.3)
* thin (to speed up Cucumber/Capybara runs)
* mysql2
* haml-rails
* formtastic
* jammit (for asset packaging)
* configy (for application-wide configuration)
* newrelic_rpm
* rpm_contrib
* hoptoad_notifier

### Development and Test
* annotate
* engineyard
* db-entropy
* ruby-debug
* rake-hooks
* factory_girl_generator
* evergreen
* fakeweb
* timecop
* shoulda
* mocha
* factory_girl_rails
* capybara
* database_cleaner
* cucumber-rails
* launchy

## Public directory
We remove unnecessary files from public (favicon, robots.txt, rails.png, index.html), create a default robots.txt that excludes the admin, and replace Prototype with jQuery.  In doing so, we download jQuery from the Google CDN to public/javascripts/jquery and register the jQuery files in Rails' defaults expansion.

## Application stuff
A bunch of different things happen here:

* Rewrite the application layout to use Haml
* Add a Configy initializer and create a default application-wide config.yml
* Create an empty hacks.rb initializer for one-off patches
* Set up a mechanism for loading core extensions from lib/core_extensions
* Set up an empty test/factories.rb for factory_girl
* Run cucumber:install and set it up to use capybara and test::unit
* Set the generator defaults to exclude stylesheets and use shoulda, haml, factory_girl, cucumber, and no fixtures
* Set up some defaults for EY Cloud Chef, Newrelic, and Hoptoad (Not implemented yet)
* Create an SSH keypair and put it in the repo under config/keypair
* Create a default database.yml.example
* Set up a build.sh script for CI (Not implemented yet)

## Git

* Create a .gitignore with some convenient defaults
* Create a git repo and add everything in an initial commit.
* Create a new Github repo and push to it (Not implemented yet)

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Commit, do not mess with rakefile, version, or history.  (if you want to have
  your own version, that is fine but bump version in a commit by itself we can
  ignore when we pull)
* Send us a pull request. Bonus points for topic branches.

License
-------
Released as public domain.  No guarantees, no warranties.
