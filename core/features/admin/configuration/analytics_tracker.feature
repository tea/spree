Feature: analytics tracker

  Scenario: index
    Given the following trackers exist:
      | analytics_id |  analytics_type   |
      | A100         |  google_analytics |
      | A101         |  google_analytics |
    Given I go to the admin home page
    When I follow "Configuration"
    When I follow "Analytics Tracker"
    Then I should see "Analytics Trackers"
    Then verify data from "table.index" with following tabular values:
      | Analytics ID | Analytics Type   | Environment | Active | Action |
      | A100         | Google Analytics | Cucumber    | Yes    | ignore |
      | A101         | Google Analytics | Cucumber    | Yes    | ignore |


  Scenario: create
    Given I go to the admin home page
    When I follow "Configuration"
    When I follow "Analytics Trackers"
    When I should see "Analytics Trackers"
    When I follow "admin_new_tracker_link"
    When I fill in "tracker_analytics_id" with "A100"
    When I select "Google Analytics" from "tracker_analytics_type"
    When I press "Create"
    Then I should see "successfully created!"
    Then verify data from "table.index" with following tabular values:
      | Analytics ID | Analytics Type   | Environment | Active | Action |
      | A100         | Google Analytics | Development | Yes    | ignore |

