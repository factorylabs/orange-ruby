# Set up core extensions framework
empty_directory 'lib/core_extensions'
initializer 'core_extensions.rb', <<-RUBY.gsub(/^ {2}/, '')
  # Long-lived core extensions and patches can go in lib/core_extensions.  They will automatically be loaded here.
  core_extension_files = Rails.root.join('lib','core_extensions','*.rb')
  Dir.glob(core_extension_files).each do |path|
    require path
  end
RUBY