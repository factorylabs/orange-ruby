Feature:
  In order to easily configure application settings
  As a user generating a new Rails app
  I would like to have configy set up for me automatically
  
  Background:
    Given I set a generous command timeout

  Scenario: The configy generator creates an initializer
    When I run "orange rails test_app"
    And I cd to "test_app"
    Then the following files should exist:
      | config/initializers/configy.rb |
      | config/config.yml              |