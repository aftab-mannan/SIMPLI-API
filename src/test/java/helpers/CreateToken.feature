Feature: Create Token

Scenario: Create Token
    Given url apiUrl
    Given path 'users/login'
    And request { "user": { "email": "#(userName)", "password": "#(userPassword)" }}
    When method post
    Then status 200
    * def authToken = response.user.token