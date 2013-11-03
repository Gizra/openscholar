Feature:
  Testing search function using apache solr.

  @api
  Scenario: Test basic search with apache solr
    Given I am not logged in
      And I visit "john"
     When I search for "john"
     Then I should see "filter by post type"

  @api
  Scenario: Test the "filter by post type" facet
    Given I am not logged in
      And I visit "john"
     When I search for "john"
      And I click on "Class" under facet "Filter By Post Type"
     Then I should see "Neil Armstrong"

  @api
  Scenario: Test the "filter by taxonomy" facet
    Given I am not logged in
      And I visit "john"
     When I search for "john"
      And I click on "Wind" under facet "Filter By Taxonomy"
     Then I should see "Mac OSX"

  @api
  Scenario: Test the "sort by" facet
    Given I am not logged in
      And I visit "john"
     When I search for "john"
      And I click on "Title" under facet "Sort by"
     Then I should see "All about nodes"

  @api
  Scenario: Test the usage of facets in series
    Given I am not logged in
      And I visit "john"
     When I search for "john"
      And I click on "Class" under facet "Filter By Post Type"
      And I should see "John F. Kennedy"
      And I should see "Neil Armstrong"
      And I click on "Fire" under facet "Filter By Taxonomy"
     Then I should see "John F. Kennedy"
      And I should not see "Neil Armstrong"

