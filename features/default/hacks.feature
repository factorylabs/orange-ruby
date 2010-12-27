@wip
Feature:
  In order to contain horrible hacks
  As a user generating a new Rails app
  I would like to have a place for hacks to live set up automatically
  
  Background:
    Given I set the command timeout to 30 seconds

  Scenario: The hacks generator creates an initializer
    When I run "orange rails test_app"
    And I cd to "test_app"
    Then a file named "config/initializers/hacks.rb" should exist