Feature: Schema Validation

Background: Define Url
    Given url apiUrl
@schema
Scenario: Schema validation with schema inline  
    * def isValidTime = read('classpath:helpers/Time-Validator.js')
    Given path 'articles'
    When method get
    Then status 200
    And match each response.articles ==
    """
        {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": '#array',
            "createdAt": '#? isValidTime(_)',
            "updatedAt": '#? isValidTime(_)',
            "favorited": "#boolean",
            "favoritesCount": "#number",
            "author": {
                "username": "#string",
                "bio": "##string",
                "image": "#string",
                "following": "#boolean",
            }
        }
    """

    @schema
    Scenario: Validate with the Third Party
      Given url 'https://reqres.in/api/users/2'
      When method GET
      Then match response == '#object'
      * string jsonSchemaExpected = read('classpath:resources/dataSchema.json')
      * string jsonData = response
      * def SchemaUtils = Java.type('helpers.JSONSchemaUtil')
      * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)