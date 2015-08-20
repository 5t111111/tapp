Feature: Object#tapp
  Scenario: Call tapp within methods chain
    Given I have the following code:
    """
    (1..5).tapp.select(&:odd?).tapp.inject(&:+)
    """

    When Ruby it
    Then I should see:
    """
    1..5
    [1, 3, 5]
    """

  Scenario: Call tapp within methods chain when the decoration option is provided
    Given I have the following code:
    """
    Tapp.config.decoration = true

    (1..5).tapp.select(&:odd?).tapp.inject(&:+)
    """

    When Ruby it
    Then I should see:
    """
    ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
    1..5
    ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
    ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
    [1, 3, 5]
    ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
    """
