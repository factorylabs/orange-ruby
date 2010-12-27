require 'thor'
require 'thor/actions'

module Orange
  module Ruby
    class CLI < Thor
      include Thor::Actions

      desc "rails [app]", "Create a new Rails 3 application from the default template"
      long_desc "Orange will generate a new Rails 3 application for you based on on the Factory default template"
    
      def rails(project)
        exec(<<-COMMAND)
          rails new #{project} \
            --template=#{template} \
            --skip-test-unit \
            --skip-prototype
        COMMAND
      end

      desc "version", "Display information about this version of Orange"
      def version
        say "Orange v#{Orange::VERSION}"
        say "Released under the MIT License.  © 2010 Factory Design Labs"
      end
      map %w(-v --version) => :version

      private

      def template
        File.expand_path(File.dirname(__FILE__) + "/../../templates/bootstrap.rb")
      end

      def git_user_name
        `git config --global user.name`.chomp.gsub('"', '\"') || "Quick Left"
      end

      def git_user_email
        `git config --global user.email`.chomp || "me@me.com"
      end
    end
  end
end