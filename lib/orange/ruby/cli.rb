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
            --template=#{template}
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
        File.expand_path(File.dirname(__FILE__) + "/../../../templates/default/template.rb")
      end

    end
  end
end