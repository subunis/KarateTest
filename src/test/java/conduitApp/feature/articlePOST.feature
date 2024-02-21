Feature: Articles
Background: URL
    Given url 'https://api.realworld.io/api/'
Scenario: Login
    Given path 'users/login'
    And request {"user": { "email": "karate@1.com", "password": "karate123" }}
    When method POST
    Then status 200
    * def token = response.user.token

    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"tagList": [],"title": "RSWDeleting","description": "article","body": "test",}}
    When method POST
    Then status 201
    * def articleId = response.article.slug

    #Given params { limit: 10, offset: 0}
    Given path 'articles/',articleId
    When method GET
    Then status 200
    And match response.article.title == 'RSWDeleting'

    Given header Authorization = 'Token ' + token
    Given path 'articles',articleId
    When method DELETE
    Then  status 204


    Given params { limit: 10, offset: 0}
    Given path 'articles',articleId
    When method GET
    Then status 404
   # And match response.article.title != 'RSWDeleting'


        

        
