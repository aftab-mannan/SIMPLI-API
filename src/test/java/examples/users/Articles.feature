
@debug
Feature: sample karate test script

Background: Define Url
     * url apiUrl
     * def articleRequestBody = read('classpath:examples/json/newArticleRequest.json')
     * def dataGenerator = Java.type('helpers.DataGenerators')
     * set articleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
     * set articleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
     * set articleRequestBody.article.body = dataGenerator.getRandomArticleValues().body

Scenario: Get Articles
    Given path 'articles'
    When method get
    Then status 200


    Scenario: Add Article
    Given path 'articles'
    And request articleRequestBody
    When method post
    Then status 200
    And match response.article.title == articleRequestBody.article.title

Scenario: Delete Articles
    Given path 'articles'
    And request articleRequestBody
    When method post
    Then status 200
    * def articleId = response.article.slug

    Given params {limit: 10, offset: 0 }
    Given path 'articles'
    When method get
    Then status 200
    And match response.articles[0].title == 'Postman Article-14'

    Given path 'articles',articleId
    When method delete
    Then status 204

    Given params {limit: 10, offset: 0 }
    Given path 'articles'
    When method get
    Then status 200
    And match response.articles[0].title != 'Postman Article-14'


@sample
Scenario: Conditional Logic
    Given params {limit: 10, offset: 0 }
    Given path 'articles'
    When method get
    Then status 200
    * def favoritesCount = response.articles[0].favoritesCount

    * def article = response.articles[0]

    # * if (favoritesCount == 0) karate.call('classpath:helpers/AddLikes.feature', article)

     * def result = favoritesCount == 0 ? karate.call('classpath:helpers/AddLikes.feature', article).likesCount : favoritesCount

    Given params {limit: 10, offset: 0 }
    Given path 'articles'
    When method get
    Then status 200
    And match response.articles[0].favoritesCount == result


Scenario: Retry call
    * configure retry = {count: 10 , interval: 5000}

    Given params {limit: 10, offset: 0 }
    Given path 'articles'
    And retry until response.articles[0].favoritesCount == 1
    When method get
    Then status 200

Scenario: Sleep call
    
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }

    Given params {limit: 10, offset: 0 }
    Given path 'articles'
    * eval sleep(5000)
    When method get
    Then status 200


Scenario: Number to String
    * def foo = 10
    * def json = {"bar": #(foo+'')}
    * match json == {"bar": '10'}


Scenario: String to Number
    * def foo = '10'
    * def json = {"bar": #(foo*1)}
    * def json2 = {"bar": #(~~parseInt(foo))}
    * match json == {"bar": 10}
    * match json2 == {"bar": 10}

