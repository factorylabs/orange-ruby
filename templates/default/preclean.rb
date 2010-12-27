say "Getting rid of files Rails provides that we don't use"

remove_file "README"
remove_file "public/index.html"
remove_file "public/images/rails.png"
remove_file "public/favicon.ico"

say "Creating a nicer default README"
create_file 'README.md', <<-FILE.gsub(/^ {2}/, '')
  #{app_name.humanize}
  ===========
  * http://github.com/factorylabs/#{app_name}
  * Application-specific documentation and notes go here.
FILE
end