# Set up Cucumber
say "Setting up Cucumber ..."
run "#{@rvm} exec rails generate cucumber:install --testunit --capybara"