# Feature:
#   In order to easily configure application settings
#   As a user generating a new Rails app
#   I would like to have an example database.yml set up automatically
#   
#   Background:
#     Given I set the command timeout to 30 seconds
# 
#   Scenario: The database generator creates a database.example.yml
#     When I run "orange rails test_app"
#     And I cd to "test_app"
#     Then a file named "config/database.example.yml" should exist