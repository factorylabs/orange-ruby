Feature:
  In order to easily drop in core extensions
  As a user generating a new Rails app
  I would like to have a core extensions directory and initializer set up for me automatically
  
  Background:
    Given I set the command timeout to 30 seconds

  Scenario: The core extensions generator creates an initializer and a lib directory
    When I run "orange rails test_app"
    And I cd to "test_app"
    Then a file named "config/initializers/core_extensions.rb" should exist
    And a directory named "lib/core_extensions" should exist