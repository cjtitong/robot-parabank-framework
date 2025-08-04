*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/Variables.robot

*** Test Cases ***
User Can Transfer Funds To Another Account
    Open Login Page
    Log In With Valid Credentials
    Go To Transfer Funds Page
    Transfer Funds Between Accounts
    Page Should Contain    ${TEXT_TRANSFER_SUCCESS}
    [Teardown]    Close Browser
