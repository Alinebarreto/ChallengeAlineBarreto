*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        http://automationpractice.com




*** Keywords ***
###Setup and Teardowm
Open Browser
    Open Browser    http://automationpractice.com   ${BROWSER}'

Close Browser
    Close Browser

### Step by Step
I access site home page
        Title Should Be                 My Store

I enter the product name "${PRODUCT}" in the box Search
        Input Text                       name=search_query   ${PRODUCT}

I click the Search button
        Click Element                    submit_search

I make sure the product "${PRODUCT}" is displayed
        Wait Until Element Is Visible    css=#center_column > h1
        Title Should Be   My Store       Search - My Store
        Page Should Contain Image        xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
        Page Should Contain Link         xpath=//*[@id="center_column"]//a[@class='product-name'][contains(text(),"${PRODUCT}")]

I check the error message "No results were found for your search "${MESSAGE_ALERT}""
       Wait Until Element Is Visible    css=#center_column > p
       Title Should Be                  My Store       Search - My Store
       Page Should Contain Textfield    xpath=//*[@class="heading-counter"][contains(text(),"0 results have been found. ")]

I click to sign in and enter e-mail "${EMAIL}"
      Click Element                    xpath=//*[@class="login"][contains(text(),"Sign in")]
      Input Text                       email_create    "${EMAIL}"
      Click Element                     id="SubmitCreate"

I click to create an account button
      Click Element                      id="SubmitCreate"

I check the error message Invalid email address
      Page Should Contain Element    id="create_account_error"

I click to sign up
    Click Element         xpath=//*[@class="logout"][contains(text(),"Sign out")]

I return to authentication
    Page Should Contain Element    xpath=//*[@class="login"][contains(text(),"Sign in")]
    Page Should Contain Element    id="center_column

I check the error message
   Page Should Contain Element    xpath=//*[@id="center_column"]/div[1]/p [contains(text(),"There is 1 error")]

I fill in the blanks below and click to send
      Wait Until Element Is Visible   xpath=//*[@class="page-subheading"][contains(text(),"Your personal information")]
##      Click Element                   id="uniform-id_gender2"
##      Input Text                      id="customer_firstname"    ${NAME}

I click to contact us
  Click Element     id="contact-link"

I check the new form
  Page Should Contain Element    xpath=//*[@id="center_column"]/h1[contains(text(),"Customer service - Contact us")]
  Page Should Contain Button    id="submitMessage"

I click to add cart
  Click Button    xpath=//*[@id="homefeatured"]//a[1]/span

I check item in my cart
   Page Should Contain Element    xpath=//*[@id="layer_cart"]//h2/i
   Page Should Contain Textfield  xpath=//*[@id="layer_cart"]/div[1]/div[2]/h2/span[contains(text(),"There is 1 item in your cart.")]

I click to shopping cart and remove iten
  Click Button    xpath=//*[@id="header"]//div/a/b
  Wait Until Element Is Visible    xpath=//*[@id="1_1_0_0"]/i
  Click Element    xpath=//*[@id="1_1_0_0"]/i

My cart is empty
  Page Should Contain Element    xpath=//*[@id="center_column"]/p[contains(text(),"Your shopping cart is empty")]

I enter ${EMAIL}
    Input Text    id="newsletter-input"    ${EMAIL}
    Click Element  name="submitNewsletter"

I check a message
  Page Should Contain Textfield    xpath=//*[@id="columns"]/p[contains(text()," Newsletter : You have successfully subscribed to this newsletter.")]
