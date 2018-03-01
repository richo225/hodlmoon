Feature: Hello

  Scenario: With a name of Emilio
    When I run `hodlmoon hello Emilio`
    Then the output should contain "Hello Emilio"

  Scenario: With no name
    When I run `hodlmoon hello`
    Then the output should contain "called with no arguments"
