Feature: Price

  Scenario: Getting price of ethereum
    When I run `hodlmoon price ethereum`
    Then the output should contain "ETH"
    And the output should contain "Ethereum"

  Scenario: Currency provided
    When I run `hodlmoon price ethereum usd`
    Then the output should contain "Price usd"
    And the output should contain "Market cap usd"

  Scenario: No currency provided
    When I run `hodlmoon price ethereum`
    Then the output should contain "Price gbp"
    And the output should contain "Market cap gbp"

  Scenario: No coin provided
    When I run `hodlmoon price`
    Then the output should contain "called with no arguments"

  Scenario: Invalid coin
    When I run `hodlmoon price invalidcoin`
    Then the output should contain "Please input the full name of a valid coin."

  Scenario: Coin symbol provided
    When I run `hodlmoon price eth`
    Then the output should contain "Please input the full name of a valid coin."
