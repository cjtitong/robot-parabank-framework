*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary
Library           Collections
Library           String
Library           OperatingSystem
Library           BuiltIn
Library           Dialogs

Resource          Variables.robot

*** Keywords ***

Open Login Page
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.3s
    Set Selenium Timeout  10s

Log In With Valid Credentials
    Fill In Login Form    ${USER_NAME}    ${USER_PASSWORD}
    Wait Until Page Contains Element    ${ACCOUNTS_OVERVIEW_HEADER}    timeout=10s

Fill In Login Form
    [Arguments]    ${username}    ${password}
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Button    xpath=//input[@value='Log In']
    Wait Until Page Contains Element    xpath=//a[text()='Log Out']    timeout=10s

Go To Bill Payment Page
    Click Link    xpath=//a[text()='Bill Pay']
    Wait Until Page Contains Element    xpath=//h1[text()='Bill Payment Service']    timeout=10s

Pay Bill Using Random Details
    Wait Until Element Is Visible    ${INPUT_PAYEE_NAME}    5s

    ${name}=         FakerLibrary.Name
    ${address}=      FakerLibrary.Address
    ${city}=         FakerLibrary.City
    ${state}=        FakerLibrary.State
    ${zip}=          FakerLibrary.Postcode
    ${raw_phone}=    FakerLibrary.Phone Number
    ${phone}=        Evaluate    ''.join([c for c in '''${raw_phone}''' if c.isdigit()])[:11]
    ${raw_account}=  FakerLibrary.Credit Card Number
    ${account}=      Evaluate    ''.join([c for c in '''${raw_account}''' if c.isdigit()])[:5]

    Input Text    ${INPUT_PAYEE_NAME}         ${name}
    Input Text    ${INPUT_ADDRESS}            ${address}
    Input Text    ${INPUT_CITY}               ${city}
    Input Text    ${INPUT_STATE}              ${state}
    Input Text    ${INPUT_ZIP_CODE}           ${zip}
    Input Text    ${INPUT_PHONE_NUMBER}       ${phone}
    Input Text    ${INPUT_ACCOUNT_NUMBER}     ${account}
    Input Text    ${INPUT_VERIFY_ACCOUNT}     ${account}
    Input Text    ${INPUT_PAYMENT_AMOUNT}     ${TRANSFER_DEFAULT_AMOUNT}
    Click Button  ${BUTTON_SEND_PAYMENT}
    Wait Until Element Is Visible    ${TEXT_BILL_PAYMENT_SUCCESS}    timeout=20s
    Element Should Contain           ${TEXT_BILL_PAYMENT_SUCCESS}    Bill Payment Complete

Verify Bill Payment Was Successful
    Wait Until Element Is Visible    ${TEXT_BILL_PAYMENT_SUCCESS}    timeout=20s
    Element Should Contain           ${TEXT_BILL_PAYMENT_SUCCESS}    Bill Payment Complete

Ensure User Is Logged In
    [Arguments]    ${username}    ${password}
    Run Keyword Unless    Page Should Contain Element    xpath=//a[text()='Log Out']
    ...    Fill In Login Form    ${username}    ${password}

Log Out From Application
    Click Element    xpath=//a[text()='Log Out']
    Wait Until Page Contains Element    xpath=//input[@value='Log In']    timeout=5s

Close Browser If Open
    Run Keyword And Ignore Error    Close Browser

Go To Transfer Funds Page
    Click Element    ${LINK_TRANSFER_FUNDS}
    Wait Until Page Contains Element    ${HEADER_TRANSFER_FUNDS_PAGE}    timeout=15s
    Wait Until Element Is Visible       ${INPUT_TRANSFER_AMOUNT}         timeout=10s
    Element Should Be Enabled           ${INPUT_TRANSFER_AMOUNT}

Transfer Funds Between Accounts
    Wait Until Element Is Visible       ${INPUT_TRANSFER_AMOUNT}         timeout=10s
    Input Text    ${INPUT_TRANSFER_AMOUNT}     ${TRANSFER_DEFAULT_AMOUNT}
    Sleep    1s    # Let the page settle before continuing
    Click Button  ${BUTTON_SUBMIT_TRANSFER}
    Wait Until Page Contains    ${TEXT_TRANSFER_SUCCESS}                timeout=10s
    Page Should Contain         has been transferred from account
