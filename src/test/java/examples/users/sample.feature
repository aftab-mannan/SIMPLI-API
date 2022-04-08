@debug
Feature: sample karate test script

Background: Define Url
    Given url apiUrl

@read
  Scenario: get all tags
  Given path 'articles'
  When method get
  Then status 200
  # And match response.tags contains 'welcome'
  # And match response.tags contains ['welcome', 'introduction']
  # And match response.tags !contains any [ 'test','best', 'introduction']
  # And match response.tags !contains 'truck'
  # And match response.tags == '#array'
  # And match response.tags == '#array'
  # And match each response.tags == '#string'
  # And match response == {"articles": "#array", "articlesCount": 3}
  And match response.articles[0].createdAt contains '2021'
  # * def jsonSchemaExpected =
  # """
  #   {
  #     "tags": "#[] #string"
  #   }
  # """
  # And match response == jsonSchemaExpected

@ignore
Scenario: get 10 articles
    Given params {limit: 10, offset: 0 }
    Given path 'articles'
    When method get
    Then status 200
    And match response.articles == '#[3]'
    And match response.articlesCount == 3


