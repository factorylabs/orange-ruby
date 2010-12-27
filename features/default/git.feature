Feature:
  In order to get the app going quickly
  As a user generating a new Rails app
  I would like to have a git repo initialized for me
  
  Background:
    Given I set a generous command timeout

  Scenario: The keypair generator creates a new RSA keypair
    When I run "orange rails test_app"
    And I cd to "test_app"
    Then the following files should exist:
      | log/.gitkeep |
      | tmp/.gitkeep |
      | .gitignore   |
    And a directory named ".git" should exist
    When I run "git log"
    Then the output should contain "Initial commit."