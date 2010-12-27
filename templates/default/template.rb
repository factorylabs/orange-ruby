# Basic Rails 3 Template 
# ======================
# by F/ Interactive

say "\nF/ Interactive Rails 3 Template\n"
say "\nDetails at http://github.com/factorylabs/orange-ruby\n"

require 'net/http'
require 'net/https'

template_root = File.expand_path(File.join(File.dirname(__FILE__)))
source_paths << File.join(template_root, "files")

# Helpers - courtesy of Thoughtbot's Suspenders gem

def concat_file(source, destination)
  contents = IO.read(find_in_source_paths(source))
  append_file destination, contents
end

def replace_in_file(relative_path, find, replace)
  path = File.join(destination_root, relative_path)
  contents = IO.read(path)
  unless contents.gsub!(find, replace)
    raise "#{find.inspect} not found in #{relative_path}"
  end
  File.open(path, "w") { |file| file.write(contents) }
end

def download_file(uri_string, destination)
  uri = URI.parse(uri_string)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true if uri_string =~ /^https/
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.path)
  contents = http.request(request).body
  path = File.join(destination_root, destination)
  File.open(path, "w") { |file| file.write(contents) }
end

# Main template
apply File.join(File.dirname(__FILE__),'preclean.rb')
apply File.join(File.dirname(__FILE__),'gemfile.rb')
apply File.join(File.dirname(__FILE__),'rvm.rb')
apply File.join(File.dirname(__FILE__),'public.rb')
apply File.join(File.dirname(__FILE__),'configy.rb')
apply File.join(File.dirname(__FILE__),'hacks.rb')
apply File.join(File.dirname(__FILE__),'core_extensions.rb')
apply File.join(File.dirname(__FILE__),'factory_girl.rb')
apply File.join(File.dirname(__FILE__),'cucumber.rb')
apply File.join(File.dirname(__FILE__),'generator_defaults.rb')
apply File.join(File.dirname(__FILE__),'newrelic.rb')
apply File.join(File.dirname(__FILE__),'hoptoad.rb')
apply File.join(File.dirname(__FILE__),'ey_cloud.rb')
apply File.join(File.dirname(__FILE__),'keypair.rb')
apply File.join(File.dirname(__FILE__),'database.rb')
apply File.join(File.dirname(__FILE__),'ci.rb')
apply File.join(File.dirname(__FILE__),'git.rb')

# Final housekeeping

docs = <<-DOCS
\nTemplate run is complete.  Please run the following to complete the setup of #{app_name.humanize}:
- Add your API key to config/initializers/hoptoad.rb
- Import your config/newrelic.yml
DOCS

log docs
