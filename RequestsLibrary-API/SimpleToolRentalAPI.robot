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


# robot -d reports ./RequestsLibrary-API/SimpleToolRentalAPI.robot
# robot -d reports -i "api4" ./RequestsLibrary-API/SimpleToolRentalAPI.robot
*** Test Cases ***
TC01
    [Tags]    api1
    Run Check API Application Status


TC02
    [Tags]    api2
    Run Get all tools

TC03
    [Tags]    api3
    Run Register a new API client


# robot -d reports -i "api4" ./RequestsLibrary-API/SimpleToolRentalAPI.robot
TCFunctional
    [Tags]    api4
    Run Check API Application Status
    Run Get all tools
    Run Register a new API client
    Run Create a new order
    Run Get a single order before Update
    Run Update an order
    Run Get a single order After Update
    Run Delete an order
    Run Get a single order After Deledte



*** Keywords ***
Run Check API Application Status
    ${response}                      GET    ${BASE_URL}/status       expected_status=200
    status should be                 200
    Should Be Equal As Strings       UP     ${response.json()['status']}
    Should Be Equal As Strings       UP     ${response.json()}[status]
    log                              ${response.json()}


Run Get all tools
    ${response}                             GET    ${BASE_URL}/tools
    status should be                        200
    log                                     ${response.json()}
    ${x}                                    get length                              ${response.json()}
    log to console    ${x}
    FOR    ${var}    IN    @{response.json()}
           IF    ${var}[id] == 2177
                 should be equal as numbers         2177                                 ${var}[id]
                 Should Be Equal As Strings         ladders                              ${var}[category]
                 Should Be Equal As Strings         Cosco Three Step Steel Platform      ${var}[name]
                 BREAK
           END
    END



Run Register a new API client
    ${first_name}         generate random string        8    [LOWER]
    ${last_name}          generate random string        8    [LOWER]
    set global variable   ${FULL_NAME}                  ${first_name} ${last_name}
    ${request_Data}       create dictionary             clientName=Postman            clientEmail=${first_name}.${last_name}@gmail.com
    ${response}           POST                          ${BASE_URL}/api-clients       json=${request_Data}
    status should be      201
    #${bearerToken}        evaluate                      ${response.json()['accessToken']}
    #${bearerToken}        ${response.json()['accessToken']}
    #${bearerToken}        ${response.json()}[accessToken]
    ${Json_data}           convert string to json       ${response.content}
    ${bearerTokenVal}      get value from json          ${Json_data}                $.accessToken
    set global variable    ${BEARER_TOKEN}              ${bearerTokenVal[0]}
    log to console         ${BEARER_TOKEN}


Run Create a new order
    ${first_name}         generate random string            8    [LOWER]
    ${last_name}          generate random string            8    [LOWER]
    set global variable   ${FULL_NAME}                      ${first_name} ${last_name}
    ${request_Data}       create dictionary                toolId=4875                     customerName=${first_name} ${last_name}
    ${headers}=           Create Dictionary                Authorization=Bearer ${BEARER_TOKEN}
    ${response}           POST                             ${BASE_URL}/orders              json=${request_Data}                     headers=${headers}
    status should be      201
    should be true        ${response.json()}[created]
    ${Json_data}          convert string to json           ${response.content}
    ${orderId}            get value from json              ${Json_data}                    $.orderId
    set global variable   ${ORDER_ID}                      ${orderId[0]}

Run Get a single order before Update
    ${headers}=                     Create Dictionary                Authorization=Bearer ${BEARER_TOKEN}
    ${response}                     GET                              ${BASE_URL}/orders/${ORDER_ID}            headers=${headers}
    status should be                200
    should be equal as strings      ${ORDER_ID}                      ${response.json()}[id]
    should be equal as integers     4875                             ${response.json()}[toolId]
    should be equal as strings      ${FULL_NAME}                     ${response.json()}[customerName]
    should not be true              ${response.json()}[processed]
    should be empty                 ${response.json()}[comment]


Run Update an order
    ${json_data}                    create dictionary                comment=call me one order ready
    ${headers}=                     Create Dictionary                Authorization=Bearer ${BEARER_TOKEN}
    ${response}                     PATCH                            ${BASE_URL}/orders/${ORDER_ID}            headers=${headers}       json=${json_data}
    status should be                204


Run Get a single order After Update
    ${headers}=                     Create Dictionary                Authorization=Bearer ${BEARER_TOKEN}
    ${response}                     GET                              ${BASE_URL}/orders/${ORDER_ID}            headers=${headers}
    status should be                200
    should be equal as strings      ${ORDER_ID}                      ${response.json()}[id]
    should be equal as integers     4875                             ${response.json()}[toolId]
    should be equal as strings      ${FULL_NAME}                     ${response.json()}[customerName]
    should not be true              ${response.json()}[processed]
    should be equal as strings      call me one order ready          ${response.json()}[comment]

Run Delete an order
    ${headers}=                     Create Dictionary                Authorization=Bearer ${BEARER_TOKEN}
    ${response}                     DELETE                           ${BASE_URL}/orders/${ORDER_ID}            headers=${headers}
    status should be                204


Run Get a single order After Deledte
    ${headers}=                     Create Dictionary                Authorization=Bearer ${BEARER_TOKEN}
    ${response}                     GET                              ${BASE_URL}/orders/${ORDER_ID}            headers=${headers}       expected_status=404
    should be equal as strings      No order with id ${ORDER_ID}.    ${response.json()}[error]
