*** Settings ***
Resource          ../resource/Resource.robot
Test Setup        Open Browser
Test Teardowm     Close Browser

*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome


*** Test Case ***
Scenario: 01: to research products valid
     Given I access site home page
     When I enter the product name "blouse" in the box Search
     Then I make sure the "blouse" is displayed a result of the search

Scenario: 02: to research products invalid
     Given I access site home page
     When I enter the product name "invalidentry" in the box search
     Then I check the error message "No results were found for your search "invalidentry""


Scenario: 03: failure create an account
 Given I access site home page
 When I click to sign in and enter e-mail "Invalidformat."
 Then I Check the error message Invalid email address

Scenario: 04: sucessfully login
      Given I access site home page
      When I complete with "bakisog964@winmails.net" and "1234567890" and click to sign in
      Then I fill in the blanks below and click to send

Scenario: 05: sucessfully Logout
      Given I access site home page
      When  I click to sign up
      Then  I return to authentication

Scenario: 06: failure login
     Given I access site home page
     When I complete with "bakisog964@winmails.net" and "invalidpassword" and click to sign in
     Then I check the error message

Scenario: 07: contact Us
     Given I access site home page
     When I click to contact us
     Then I check the new form


Scenario: 08: add iten to cart
      Given I access site home page
      When I click to add cart
      Then I check item in my cart


Scenario: 09: delete itens to cart
      Given I click to add cart
      When I click to shopping cart and remove iten
      Then My cart is empty


Scenario: 10: subscribe to newsletter
      Given I access site home page
      When I enter e-mail "aline.michelle.barreto@gmail.com"
      Then I check a message



*** Keywords ***
Given I access site home page
      access site home page

When enter the product name "${PRODUCT}" in the box Search
      enter the product name "${PRODUCT}" in the box Search
      click the Search button

Then make sure the "${PRODUCT}" is displayed a result of the search
      make sure the product "${PRODUCT}" is displayed

Then check the error message "${MESSAGE_ALERT}"
      check the error message "No results were found for your search "${MESSAGE_ALERT}""

When click to sign in and enter e-mail "${EMAIL}"
     click to sign in and enter e-mail "${EMAIL}"

Then Check the error message Invalid email address
     check the error message Invalid email address

Then fill in the blanks below and click to send
     fill in the blanks below and click to send


When I click to contact us
     I click to contact us

Then I check the new form
     I check the new form

When I click to add cart
     I click to add cart

Then I check item in my cart
     I check item in my cart

When I click to shopping cart and remove iten
     I click to shopping cart

Then My cart is empty
     My cart is empty

When I enter e-mail ${EMAIL}
     I enter ${EMAIL}

Then I check a message
     I check a message
