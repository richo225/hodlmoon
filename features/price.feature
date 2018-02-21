Feature: Price

  Scenario: Price of ethereum
    When I run `hodlmoon price`

  Scenario: No currency provided
    When I run `hodlmoon price ethereum`
    Then the output should contain "Price gbp"
    And the output should contain "Market cap gbp"

  Scenario: Currency provided
    When I run `hodlmoon price ethereum usd`
    Then the output should contain "Price usd"
    And the output should contain "Market cap usd"
