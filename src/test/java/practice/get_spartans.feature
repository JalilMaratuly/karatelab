  @spartan
  Feature: Spartan Rest API - get spartan tests

    Background:
      Given url spartan_base_url

    Scenario: Get all spartans using /spartans endpoint
      And path "spartans"
      When method GET
      Then status 200
      And match header Content-Type == "application/json"
      And print response

    Scenario: Get single spartan and verify data
      And path "spartans/1"
      When method GET
      Then status 200
      And match header Content-Type == "application/json"
      And match response.id == 1
      And match response.name == "Meade"
      * def gender = response.gender
      * print "gender = " , gender
      And match gender == "Male"
      * def phone = response.phone
      And match phone == 3584128232

    Scenario: Query params - search for spartans
      #And path "spartans/search"
      And path "spartans" , "search"
      And param gender = "Female"
      And param nameContains = "A"
      And header Accept = "application/json"
      And method GET
      Then status 200
      And match header Content-Type == "application/json"
      * print "total element count = " , response.totalElement
      And match response.totalElement == 32
      * print "first name of first person = " , response.content[0].name
      ##* print "all first names in response = " , response.content[*].name
    #verify Jaimie is amoung the names
      And match response.content[*].name contains "Jaimie"
      #verify Lorenza, Nona, Elisabeth are among the names
      * match response.content[*].name contains ["Lorenza", "Nona", "Elisabeth"]

      #check if each gender value is "Female"
      * match each response.content[*].gender == "Female"
