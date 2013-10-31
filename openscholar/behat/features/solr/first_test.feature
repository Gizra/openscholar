Feature:
  Testing search function using apache solr.

  @api
  Scenario: Test search with apache solr
    Given I am logging in as "john"
     When I search for "john"
     Then I should see "filter by post type"
