Feature: Sign up user

Background: Application Url
    * def dataGenerator = Java.type('helpers.DataGenerators')
    * def randomEmail = dataGenerator.getEmail()
    * def randomUsername = dataGenerator.getUsername()
    Given url apiUrl

@signup
Scenario Outline: Signup user

    Given path 'users'
    And request 
    """
        {
            "user": {
                "email": "<email>",
                "password": "<password>",
                "username": "<username>"
            }
        }
    """
    When method post
    Then status 422
    And match response == <errorresponse>

    Examples:
    |   email            |   password    |   username      |   errorresponse                                        |
    |   #(randomEmail)   |   Karate123   |   udemyuser3    |   {"errors":{"username":["has already been taken"]}}   |


Scenario: Signup user

    * def jsFunction  = 
    """
        function () {
            var DataGenerator = Java.type('helpers.DataGenerators')
            var generator = new DataGenerators()
            return generator.getEmail2()
        }
    """
    * def randomEmail2 = call jsFunction

    Given path 'users'
    And request 
    """
        {
            "user": {
                "email": #(randomEmail2),
                "password": "udemyuser123",
                "username": #(randomUsername)
            }
        }
    """
    When method post
    Then status 200