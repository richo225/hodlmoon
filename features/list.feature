Feature: List

  Scenario: Default limit
    When I run `hodlmoon list`
    Then the output should contain " 8 "
    And the output should not contain " 9 "

  Scenario: Limit of 20
    When I run `hodlmoon list 20`
    Then the output should contain " 20 "
    And the output should not contain " 21 "

  Scenario: Currency provided
    When I run `hodlmoon list 20 usd`
    Then the output should contain "Price usd"
    And the output should contain "Market cap usd"

  Scenario: No currency provided
    When I run `hodlmoon list`
    Then the output should contain "Price gbp"
    And the output should contain "Market cap gbp"
