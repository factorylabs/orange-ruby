# Tweak the Public directory
log "\n-- Processing public directory ...\n"

  # Remove files we don't care about
  log "\n    Removing unnecessary files ...\n"
  remove_file "README"
  remove_file "public/index.html"
  remove_file "public/favicon.ico"
  remove_file "public/robots.txt"
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
