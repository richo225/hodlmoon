Feature: Portfolio

  Background:
    Given a directory named "Documents"

  Scenario: Getting portfolio data
    Given a file named "Documents/my_portfolio.yml" with:
    """
    Ethereum
    NEO
    """
    When I run `hodlmoon portfolio Documents/my_portfolio.yml`
    And the output should contain "Ethereum"
    And the output should contain "NEO"
    And the output should not contain "Bitcoin"

  Scenario: Currency provided
    Given a file named "Documents/my_portfolio.yml" with:
    """
    Ethereum
    """
    When I run `hodlmoon portfolio Documents/my_portfolio.yml usd`
    Then the output should contain "Price usd"

  Scenario: No currency provided
    Given a file named "Documents/my_portfolio.yml" with:
    """
    Ethereum
    """
    When I run `hodlmoon portfolio Documents/my_portfolio.yml`
    Then the output should contain "Price gbp"
    And the output should contain "Market cap gbp"

  Scenario: Getting data from an empty file
    Given a file named "Documents/my_portfolio.yml" with:
    """
    """
    When I run `hodlmoon portfolio Documents/my_portfolio.yml`
    Then the output should contain "Price gbp"
    And the output should not contain "Ethereum"
    And the output should not contain "Bitcoin"

  Scenario: File doesn't exist
    When I run `hodlmoon portfolio Documents/my_portfolio.yml`
    Then the output should contain "No such file exists"

  Scenario: No file provided
    When I run `hodlmoon portfolio`
    Then the output should contain "called with no arguments"
