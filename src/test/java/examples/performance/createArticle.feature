
@debug
Feature: sample karate test script

Background: Define Url
     * url apiUrl
     * def articleRequestBody = read('classpath:examples/json/newArticleRequest.json')
     * def dataGenerator = Java.type('helpers.DataGenerators')
     * set articleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
     * set articleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
     * set articleRequestBody.article.body = dataGenerator.getRandomArticleValues().body

Scenario: Delete Articles
    Given path 'articles'
    And request articleRequestBody
    When method post
    Then status 200
    * def articleId = response.article.slug


    Given path 'articles',articleId
    When method delete
    Then status 204