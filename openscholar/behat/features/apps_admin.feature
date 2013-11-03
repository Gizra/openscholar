Feature:
  Testing the managing of OpenScholar

  @api
  Scenario: Check that all of the apps are turned on
    Given I am logging in as "john"
      And I visit "john"
     When I click "Build"
      #And I should see "Apps"
     Then I should see the "spaces" table with the following <contents>:
      | Bio/CV        | Public |
      | Blog          | Public |
      | Booklets      | Public |
      | Classes       | Public |
      | Dataverse     | Public |
      | Events        | Public |
      | Image Gallery | Public |
      | Links         | Public |
      | News          | Public |
      | Basic Pages   | Public |
      | Presentations | Public |
      | Profiles      | Public |
      | Publications  | Public |
      | Reader        | Public |
      | Software      | Public |

  @api @me
  Scenario Outline: Testing the csv importing for blog.
    Given I am logging in as "admin"
    When I visit <import-address>
    And I should print page
    And I visit <address>
    Then I should see <title>
    And I should see <body>

  Examples:
    | import-address                  | address                                   | title                   | body                            |
    | "john/os-importer-demo/blog"    | "john/blog"                               | "Blog from csv"         | "This is a blog from csv file"  |
    | "john/os-importer-demo/news"    | "john/news"                               | "Testing import news"   | "Testing the import of news"    |
    | "john/os-importer-demo/event"   | "john/calendar?type=day&day=2013-10-17"   | "Testing importing"     | ""                              |

  @api @me
  Scenario: Verify that the vocabularies and terms from the CSV created
  successfully.
    Given I visit "john/blog/blog-csv"
    Then I should see "Johnny B good"
    And I should see "Californication"
    And I should see "Chuck Berry"
    And I should see "Red hot chili peppers"
