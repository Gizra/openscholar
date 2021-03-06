Feature:
  Testing the viewing of list of subsites, which should be allowed
  only to admins.

  @api
  Scenario: Test view subsites for user with permission
    Given I am logging in as "john"
     When I visit "edison/subsites"
     Then I should see "Tesla"

  @api
  Scenario: Test view subsites for user with no permission
    Given I am logging in as "alexander"
     When I go to "edison/subsites"
     Then I should get a "403" HTTP response
