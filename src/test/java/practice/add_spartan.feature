
  Feature: Add new spartan scenarios

    Background:
      * url spartan_base_url

    Scenario: Variables practice
      * def automationTool = "karate"
      * def num1 = 10
      * def num2 = 20
      * print "tool name = " , automationTool
      * print "sum = ", num1 + num2
      * def payload = {name: 'Karate', gender: 'Male', phone: 3211231234}
      * print "json request body = " , payload
      * match payload ==
      """
        {
          "name": "Karate",
          "gender": "Male",
          "phone": 3211231234
        }
      """
