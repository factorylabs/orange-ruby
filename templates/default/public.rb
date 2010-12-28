# Remove files we don't care about
remove_file "public/index.html"
remove_file "public/favicon.ico"
remove_file "public/robots.txt"
remove_file "public/images/rails.png"

# Create a sane robots.txt
robots_txt = <<-ROBOTS.gsub(/^ {2}/, '')
  # See http://www.robotstxt.org/wc/norobots.html for documentation on how to use the robots.txt file
  #
  User-Agent: *
  Disallow: /admin

ROBOTS

create_file "public/robots.txt", robots_txt