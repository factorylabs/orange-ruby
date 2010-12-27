# Configure RVM
say "\n-- Processing RVM ...\n"

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