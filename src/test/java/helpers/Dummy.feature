Feature: Dummy Feature

Scenario: Dummy
    * def dataGenerator = Java.type('helpers.DataGenerators')
    * def userId = dataGenerator.getUsername()
    * print userId