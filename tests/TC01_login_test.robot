*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/keywords.robot
Resource    ../resources/Variables.robot

*** Test Cases ***
User Can Log In Successfully
    Open Login Page
    Log In With Valid Credentials
    Page Should Contain Element    ${ACCOUNTS_OVERVIEW_HEADER}
    [Teardown]    Close Browser