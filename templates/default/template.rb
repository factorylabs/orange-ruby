log "\nFDL Rails 3 template\n"
log "\nDetails at http://github.com/factorylabs/templates\n"

base_url  = "https://github.com/factorylabs/templates/raw/master/templates/default"

# What templates do we want to apply?
templates = [ 'gemfile', 
              'rvm',
              'public',
              'app',
              'git' ]

# Rip through them
templates.each { |template| apply("#{base_url}/_#{template}.rb") }

# Final housekeeping

docs = <<-DOCS
\nTemplate run is complete.  Please run the following to complete the setup of #{app_name.humanize}:
- Add your API key to config/intializers/hoptoad.rb
- Import your config/newrelic.yml
DOCS

log docs
