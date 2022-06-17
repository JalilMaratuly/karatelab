
06/15/2022

Karate Automation Framework Intro
Day 1
---------------------------------

Karate is BDD style automation tool, that can help automate
APIs, UI etc tests.

It is partially one of codeless automation tools.

codeless -> meaning you do not have to write java classes to use this tool and automate tests.

Official documentation: https://github.com/karatelabs/karate

Nowadays , market team sees many job requirements with this tool. So we are having few hours to go over and learn karate.

========================

Automation Tools:
Licensed:
- HP QTP/UFT
- TestComplete from Smartbear
- Tosca
- ReadyAPI etc
.......
Open Source:
- Selenium WebDriver
- Cypress
- Protractor
- TestCafe
-> pre-built framework:
-> karate
-> selenide
-> serenity
-> neodymium
etc

pre-built framework -> already includes utilities, support for browsers, reporting, and structure that you can follow.

==================================

karate supports feature files and we do not need to write step definition java classes like in Cucumber.
It supports API test automation, UI , Performance tests.

==================================

How to create a project.

1) we could create empty project and add karate dependency

<dependency>
    <groupId>com.intuit.karate</groupId>
    <artifactId>karate-junit5</artifactId>
    <version>1.2.0</version>
    <scope>test</scope>
</dependency>

However , i will need to add folder structure, maybe some setting files etc.

So, instead we can use MAVEN ARCHETYPE to quickly create our karate project.

MAVEN ARCHETYPE  -> is a pre-built template of the project/skeleton project, it will include, dependencies in pom.xml, some test example, some setting files etc.

We can use below command in COMMAND LINE:

mvn archetype:generate \
-DarchetypeGroupId=com.intuit.karate \
-DarchetypeArtifactId=karate-archetype \
-DarchetypeVersion=1.2.0 \
-DgroupId=com.mycompany \
-DartifactId=myproject

For above to work, we need to have maven installed in our local machine. mvn -version should work.

So if you do not have maven commandline installed , then we can use Intellij IDE for archetype as well.

1) Open intellij IDea

2) File > New > Project

3) Select maven from left side and check 'create from archetype'

4) Click on Add archetype

Group id = com.intuit.karate
Artifact id = karate-archetype
Version = 0.9.4

clone and open below in Intellij

https://github.com/murodil-cybertek/B25-karate
The above is exact result of using karate maven archetype.

===========================================================

In your resume:
Skills list:
Automation Tools: Selenium ... Karate

Karate -> I added a smoke test for one of our REST API applications

===========================================================

if below error happens:
Cannot invoke "javax.script.ScriptEngine.createBindings()" because "com.intuit.karate.ScriptBindings.NASHORN" is null

Use higher java version.
and use
<karate.version>1.2.0</karate.version>

===========================================================

When using karate , we add feature files under src/test/java
and not under src/test/resources like in cucumber

hello.feature under examples

===========================================================
Test Data:

We can add test data to karate-config.js file using key:value format:

var config = {
env: env,
hello_world_api_url: 'https://sandbox.api.service.nhs.uk/hello-world'
}

-------------

Karate Keywords:

Set url:
Given url 'https://sandbox.api.service.nhs.uk/hello-world'

Set api method path
And path '/hello/world'

How to send request using karate:
When method GET
When method POST
When method PUT
When method DELETE
...

Verify status code using karate:

	Then status 200

How to verify json response body:
match keyword
we can use response keyword along with the path to the value

{
"message": "Hello World!"
}

Then match response.message == "Hello World!"

{
"message": "Hello World!",
"address": {
"city" : "Chicago"
}
}

Then match response.address.city == "Chicago"
================================================

Verifying headers using karate:
using match and header keywords:
Content-Type: application/json; charset=UTF-8

And match header Content-Type == "application/json; charset=UTF-8"

================================================


06/16/2022
----------

Karate Intro Day 2.

Spartan App Ip addresses:

http://54.156.66.212/
http://3.233.187.197/

http://54.156.66.212:8000

add new feature file:
get_spartans.feature


http://54.156.66.212:8000/api/spartans

http://3.233.187.197:8000/api

http://54.156.66.212:8000/api/spartans/search?nameContains=A&gender=Female
=============================

Verify data using karate

* match response.name == "Meade"

------------------
Declare variables:

* def phone = response.phone
* def num1 = 10
* def num2 = 20

------------------

Pass query parameters:

And param gender = "Female"
And param nameContains = "A"

------------------

Verifying list of values using Contains

And match response.content[*].name contains "Jaimie"
#verify Lorenza, Nona, Elisabeth are among the names
* match response.content[*].name contains ["Lorenza", "Nona", "Elisabeth"]

-------------------

Read value from certain index:

* print "first name of first person = " , response.content[0].name

-------------------

UI automation using Karate:

Scenario: Search for SDET jobs on google
Given driver google_url
And input('input[name=q]','SDET remote jobs')
And click('input[name=btnK]')
And click('div[id=hdtb-tls]')

--------------------

How to use java class method from karate feature file:

Scenario: Call Utils.getName() method
#assign Utils class object into Utils variable
* def Utils = Java.type("practice.Utils")

Summary:
As SDET I always try new tools , and recently I added API smoke test using KARATE tool.

	-> karate feature files
	-> BDD keywords , When, then etc
	-> use pre-defined methods
	-> declare/define variables
	etc

