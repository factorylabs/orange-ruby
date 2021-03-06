# Set up generator defaults  
generators = <<-RUBY
  config.generators do |g|
      g.template_engine     :haml
      g.stylesheets         false  
      g.test_framework      :shoulda,     :fixture => false
      g.fixture_replacement :factory_girl
      g.integration_tool    :cucumber
    end
RUBY
application generators