Feature: List

  Scenario: Limit of 2
    When I run `hodlmoon list 2`
    Then the output should contain " 2 "
    And the output should not contain " 3 "

  Scenario: Currency provided
    When I run `hodlmoon list 2 usd`
    Then the output should contain "Current price"
    And the output should contain " 2 "
