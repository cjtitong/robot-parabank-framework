*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/Variables.robot

*** Test Cases ***
User Can Pay Bills With Random Data
    Open Login Page
    Log In With Valid Credentials
    Go To Bill Payment Page
    Pay Bill Using Random Details
    Verify Bill Payment Was Successful
    [Teardown]    Close Browser
