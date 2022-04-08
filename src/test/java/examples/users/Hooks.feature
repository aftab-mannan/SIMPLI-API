@hooks
Feature: Hooks

Background: Hooks call
# * def result = callonce read('classpath:helpers/Dummy.feature')
# * def username = result.userId

# after hooks
* configure afterScenario = function() { karate.call('classpath:helpers/Dummy.feature')}
* configure afterFeature = 
"""
        function(){
        karate.console.log('After Feature Text');
    }
""" 


Scenario: First Scenario
    # * print username
    * print 'Scenario One'


Scenario: Second Scenario
    # * print username
    * print 'Scenario Two'