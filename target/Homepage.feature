#Feature: Test API for the HOME page
#Background: URL
    #Given url 'https://api.realworld.io/api/'       

@debug
#Scenario: Get all tags
  
  Given path 'tags'
  When method GET
  Then status 200
  And match response.tags  contains ['exercitationem', 'consequatur']

#Scenario: Get all the articles
    #Given param limit = 10
    #Given param  offset = 0
    Given params { limit: 10, offset: 0}
    Given path 'articles'
    When method GET
    Then status 200
