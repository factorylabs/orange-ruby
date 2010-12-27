Feature:
  In order to easily configure tests
  As a user generating a new Rails app
  I would like to have a blank factories.rb set up automatically
  
  Background:
    Given I set a generous command timeout

  Scenario: The factory_girl generator creates factories.rb
    When I run "orange rails test_app"
    And I cd to "test_app"
    Then a file named "test/factories.rb" should exist