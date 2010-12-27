Feature:
  In order to deploy the app on EY Cloud
  As a user generating a new Rails app
  I would like to have a cloud hooks and recipes set up for me
  
  Background:
    Given I set the command timeout to 30 seconds

  Scenario: The ey_cloud generator creates all the hooks files
    When I run "orange rails test_app"
    And I cd to "test_app"
    Then the following files should exist:
      | deploy/before_migrate.rb |
      | deploy/after_migrate.rb  |
      | deploy/before_symlink.rb |
      | deploy/after_symlink.rb  |
      | deploy/before_restart.rb |
      | deploy/after_restart.rb  |
    And a directory named "cookbooks" should exist