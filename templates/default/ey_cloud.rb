# Set up EY hooks files
say "Setting up EY Cloud deploy hooks ..."

empty_directory 'deploy'

file 'deploy/before_migrate.rb', <<-RUBY.gsub(/^ {2}/, '')
  # EY Cloud Deploy - Pre-Migration Hooks
  # See http://docs.engineyard.com/appcloud/guides/deployment/home#deploy-hooks for details
RUBY

file 'deploy/after_migrate.rb', <<-RUBY.gsub(/^ {2}/, '')
  # EY Cloud Deploy - Post-Migration Hooks
  # See http://docs.engineyard.com/appcloud/guides/deployment/home#deploy-hooks for details
RUBY

file 'deploy/before_symlink.rb', <<-RUBY.gsub(/^ {2}/, '')
  # EY Cloud Deploy - Pre-Symlink Hooks
  # See http://docs.engineyard.com/appcloud/guides/deployment/home#deploy-hooks for details
RUBY

file 'deploy/after_symlink.rb', <<-RUBY.gsub(/^ {2}/, '')
  # EY Cloud Deploy - Post-Symlink Hooks
  # See http://docs.engineyard.com/appcloud/guides/deployment/home#deploy-hooks for details
RUBY

file 'deploy/before_restart.rb', <<-RUBY.gsub(/^ {2}/, '')
  # EY Cloud Deploy - Pre-Restart Hooks
  # See http://docs.engineyard.com/appcloud/guides/deployment/home#deploy-hooks for details
RUBY

file 'deploy/after_restart.rb', <<-RUBY.gsub(/^ {2}/, '')
  # EY Cloud Deploy - Post-Restart Hooks
  # See http://docs.engineyard.com/appcloud/guides/deployment/home#deploy-hooks for details
RUBY

# Import cookbooks
say "Importing chef cookbooks ..."
download_file "https://github.com/factorylabs/ey-cloud-recipes/tarball/master"

# TODO: Flesh this out.