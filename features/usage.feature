Feature: Usage

  As an aVtonomKa user
  I want to see the usage page
  So that I can get familiar with avtonomka cli

  Scenario: User runs application with no arguments
    When I run `./bin/avtonomka`
    Then the stdout should contain exactly the content of "./pages/usage.txt"

