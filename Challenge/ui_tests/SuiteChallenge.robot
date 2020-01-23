*** Settings ***
Resource          ../resource/Resource.robot
Test Setup        Open Browser
Test Teardowm     Close Browser


*** Test Case ***
Test Case 01: to research products valid
  access site home page
  enter the product name "blouse" in the box Search
  click the Search button
  make sure the product "blouse" is displayed


Test Case 02: to research products invalid
   access site home page
   enter the product name "invalidentry" in the box Search
   click the Search button
   Check the error message "No results were found for your search "invalidentry""


Test Case 03: failure create an account
   access site home page
   click to sign in and enter e-mail "Invalidformat."
   click to create an account button
   Check the error message Invalid email address

Test Case 04: sucessfully create an account
   access site home page
   click to sign in and enter e-mail "aline.michelle.barreto@gmail.com"
   click to create an account button
   fill in the blanks below and click to send


Test Case 05: sucessfully login
   access site home page


Test Case 06: failure login
   access site home page



Test Case 07: contact Us
   access site home page


Test Case 08: add itens to cart
   access site home page


Test Case 09: delete itens to cart
   access site home page


Test Case 10: subscribe to newsletter
   access site home page


*** Keywords ***
