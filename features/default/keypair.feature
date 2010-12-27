@wip 
Feature:
  In order to deploy the app on EY Cloud
  As a user generating a new Rails app
  I would like to have a cloud keypair set up for me
  
  Background:
    Given I set the command timeout to 30 seconds

  Scenario: The keypair generator creates a new RSA keypair
    When I run "orange rails test_app"
    And I cd to "test_app"
    Then the following files should exist:
      | config/keypair/id_rsa     |
      | config/keypair/id_rsa.pub |