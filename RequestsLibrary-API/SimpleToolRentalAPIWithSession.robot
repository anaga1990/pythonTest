*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Library    JSONLibrary

*** Variables ***
${BASE_URL}=    https://simple-tool-rental-api.glitch.me
${BEARER_TOKEN}
${FULL_NAME}
${ORDER_ID}


# robot -d reports ./RequestsLibrary-API/SimpleToolRentalAPIWithSession.robot
*** Test Cases ***
Functional Testing
    [Tags]    apiV2
    Run Register a new API client
    Run Create a new order
    Run Get a single order          CREATED ORDER
    Run Update an order
    Run Get a single order          verify_order_details=UPDATED ORDER
    Run Delete an order
    Run Get a single order          verify_order_details=DELETED ORDER

*** Keywords ***
Run Register a new API client
    ${first_name}         generate random string        8    [LOWER]
    ${last_name}          generate random string        8    [LOWER]
    set global variable   ${FULL_NAME}                  ${first_name} ${last_name}
    ${request_Data}       create dictionary             clientName=Postman            clientEmail=${first_name}.${last_name}@gmail.com
    ${response}           POST                          ${BASE_URL}/api-clients       json=${request_Data}
    status should be      201
    ${Json_data}           convert string to json       ${response.content}
    ${bearerTokenVal}      get value from json          ${Json_data}                $.accessToken
    set global variable    ${BEARER_TOKEN}              ${bearerTokenVal[0]}
    log to console         ${BEARER_TOKEN}


Run my Session
    ${headers}=           Create Dictionary             Authorization=Bearer ${BEARER_TOKEN}
    create session        toolsSession                  ${BASE_URL}                     headers=${headers}      verify=False        disable_warnings=0


Run Create a new order
    ${first_name}         generate random string            8    [LOWER]
    ${last_name}          generate random string            8    [LOWER]
    set global variable   ${FULL_NAME}                      ${first_name} ${last_name}
    ${request_Data}       create dictionary                toolId=4875                     customerName=${first_name} ${last_name}
    Run my Session
    ${response}           POST On Session                  toolsSession                    /orders              json=${request_Data}
    status should be      201
    should be true        ${response.json()}[created]
    ${Json_data}          convert string to json           ${response.content}
    ${orderId}            get value from json              ${Json_data}                    $.orderId
    set global variable   ${ORDER_ID}                      ${orderId[0]}


Run Get a single order
    [Arguments]                     ${verify_order_details}
    Run my Session
    #${response}                     GET On Session                      toolsSession                            /orders/${ORDER_ID}
    IF  '${verify_order_details}' == 'CREATED ORDER' or '${verify_order_details}' == 'UPDATED ORDER'
        ${response}                     GET On Session                      toolsSession                            /orders/${ORDER_ID}         expected_status=200
        status should be                200
        should be equal as strings      ${ORDER_ID}                         ${response.json()}[id]
        should be equal as integers     4875                                ${response.json()}[toolId]
        should be equal as strings      ${FULL_NAME}                        ${response.json()}[customerName]
        should not be true              ${response.json()}[processed]
    ELSE
        ${response}                     GET On Session                      toolsSession                            /orders/${ORDER_ID}         expected_status=404
        status should be                404
        should be equal as strings      No order with id ${ORDER_ID}.           ${response.json()}[error]
    END
    IF          '${verify_order_details}' == 'CREATED ORDER'
                should be empty                                                 ${response.json()}[comment]
    ELSE IF     '${verify_order_details}' == 'UPDATED ORDER'
                should be equal as strings      call me one order ready         ${response.json()}[comment]
    END

Run Update an order
    Run my Session
    ${json_data}                    create dictionary                   comment=call me one order ready
    ${response}                     PATCH On Session                    toolsSession                            /orders/${ORDER_ID}                     json=${json_data}
    status should be                204


Run Delete an order
    Run my Session
    ${response}                     DELETE On Session                   toolsSession                            /orders/${ORDER_ID}
    status should be                204




