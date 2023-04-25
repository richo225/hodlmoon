Feature: Price

  Scenario: Getting price of ethereum with no currency provided
    When I run `hodlmoon price ethereum`
    Then the output should contain "eth"
    And the output should contain "Ethereum"

  Scenario: Currency provided
    When I run `hodlmoon price ethereum usd`
    Then the output should contain "Current price"
    And the output should contain "Market cap"

  Scenario: No coin provided
    When I run `hodlmoon price`
    Then the output should contain "called with no arguments"

  Scenario: Invalid coin
    When I run `hodlmoon price invalidcoin`
    Then the output should contain "Please input the full name of a valid coin."
