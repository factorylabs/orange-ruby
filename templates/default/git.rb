# Keep the log and tmp directories intact
create_file "log/.gitkeep"
create_file "tmp/.gitkeep"

# Create a .gitignore file and a new local repository, commit everything
remove_file '.gitignore'

file '.gitignore', <<-CODE.gsub(/^ {2}/, '')
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

# Initialize Git repository
git :init

# Do the initial commit
git :add => "."
git :commit => "-am 'Initial commit.'"