*** Variables ***
# Base URL and user credentials
${BASE_URL}                       https://parabank.parasoft.com/parabank/index.htm
${USER_NAME}                      john
${USER_PASSWORD}                  demo
${ACCOUNTS_OVERVIEW_HEADER}       xpath=//*[@id="showOverview"]/h1

# Bill Payment Form fields
${INPUT_PAYEE_NAME}               name=payee.name
${INPUT_ADDRESS}                  name=payee.address.street
${INPUT_CITY}                     name=payee.address.city
${INPUT_STATE}                    name=payee.address.state
${INPUT_ZIP_CODE}                 name=payee.address.zipCode
${INPUT_PHONE_NUMBER}             name=payee.phoneNumber
${INPUT_ACCOUNT_NUMBER}           name=payee.accountNumber
${INPUT_VERIFY_ACCOUNT}           name=verifyAccount
${INPUT_PAYMENT_AMOUNT}           name=amount
${BUTTON_SEND_PAYMENT}            xpath=//*[@id="billpayForm"]/form/table/tbody/tr[14]/td[2]/input
${TEXT_BILL_PAYMENT_SUCCESS}      xpath=//*[@id="billpayResult"]/h1

# Transfer Funds form
${LINK_TRANSFER_FUNDS}            xpath=//*[@id="leftPanel"]/ul/li[3]/a
${HEADER_TRANSFER_FUNDS_PAGE}     xpath=//*[@id="showForm"]/h1
${INPUT_TRANSFER_AMOUNT}          xpath=//*[@id="amount"]
${SELECT_FROM_ACCOUNT}            name=fromAccountId
${SELECT_TO_ACCOUNT}              name=toAccountId
${BUTTON_SUBMIT_TRANSFER}         xpath=//*[@id="transferForm"]/div[2]/input
${TRANSFER_DEFAULT_AMOUNT}        500
${TEXT_TRANSFER_SUCCESS}          Transfer Complete!
