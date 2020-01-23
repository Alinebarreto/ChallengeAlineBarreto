

*** Settings ***
Documentations   Documentaion API   https://jsonplaceholder.typicode.com/
Library          RequestLibrary
Library          Collections


*** Variable ***
${URL_API}      https://jsonplaceholder.typicode.com/users

*** Keywords ***
###SETUP AND TEADOWNS
conect my api
  Create Session    jsonplaceholder   ${URL_API}


###Actions
get all users must have a name, username, and e-mail
  ${RESPOSTA}  Get Request   jsonplaceholder  users
  Log       ${RESPOSTA.text}
