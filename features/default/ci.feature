Feature:
  In order to have the app tested consistently
  As a user generating a new Rails app
  I would like to have a build script set up for me
  
  Background:
    Given I set a generous command timeout

  Scenario: The core extensions generator creates a build.sh
    When I run "orange rails test_app"
    And I cd to "test_app"
    Then a file named "build.sh" should exist