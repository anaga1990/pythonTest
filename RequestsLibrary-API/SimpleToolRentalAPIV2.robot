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
${EMAIL}

# robot -d reports ./RequestsLibrary-API/SimpleToolRentalAPIV2.robot
*** Test Cases ***


TCFunctional
    [Tags]    api4
    Run Check API Application Status
    Run Get all tools
    Run Get all tools with Dynamic          DO_WE_HAVE_QUERY_PARAMES=NO
    Run Get all tools with Dynamic          DO_WE_HAVE_QUERY_PARAMES=YES
    Run Register a new API client
    Run Create a new order
    Run Get a single order                  CREATED ORDER
    Run Update an order
    Run Get a single order                  UPDATED ORDER
    Run Delete an order
    Run Get a single order                  DELETED ORDER



*** Keywords ***
Run Check API Application Status
    ${response}                      GET    ${BASE_URL}/status       expected_status=200
    status should be                 200
    Should Be Equal As Strings       UP     ${response.json()}[status]




Run Get all tools
    ${response}                             GET    ${BASE_URL}/tools
    status should be                        200
    log                                     ${response.json()}
    ${x}                                    get length                              ${response.json()}
    FOR    ${var}    IN    @{response.json()}
           IF    ${var}[id] == 2177
                 should be equal as numbers         2177                                 ${var}[id]
                 Should Be Equal As Strings         ladders                              ${var}[category]
                 Should Be Equal As Strings         Cosco Three Step Steel Platform      ${var}[name]
                 BREAK
           END
    END









Run Get all tools with Dynamic
    [Arguments]                             ${DO_WE_HAVE_QUERY_PARAMES}
    IF      '${DO_WE_HAVE_QUERY_PARAMES}' == 'NO'
            ${response}                     GET                                     ${BASE_URL}/tools
    ELSE
            ${query_params}=                Create Dictionary                       results=10                       available=true
            ${response}                     GET                                     ${BASE_URL}/tools                params=${query_params}     expected_status=200
    END
    log                                     ${response.json()}
    ${x}                                    get length                              ${response.json()}
    FOR    ${var}    IN    @{response.json()}
           IF    ${var}[id] == 2177
                 should be equal as numbers         2177                                 ${var}[id]
                 Should Be Equal As Strings         ladders                              ${var}[category]
                 Should Be Equal As Strings         Cosco Three Step Steel Platform      ${var}[name]
                 BREAK
           END
    END











Run Register a new API client
    Created Data For Register a new API client
    ${request_Data}                 create dictionary             clientName=Postman            clientEmail=${EMAIL}
    ${response}                     POST                          ${BASE_URL}/api-clients       json=${request_Data}                        expected_status=201
    status should be                201
    ${Json_data}                    convert string to json       ${response.content}
    ${bearerTokenVal}               get value from json          ${Json_data}                $.accessToken
    set global variable             ${BEARER_TOKEN}              ${bearerTokenVal[0]}














Run Create a new order
    ${request_Data}                 Created Data For new Order
    ${headers}                      set API Auth
    ${response}                     POST                             ${BASE_URL}/orders              json=${request_Data}                     headers=${headers}            expected_status=201
    should be true                  ${response.json()}[created]
    ${Json_data}                    convert string to json           ${response.content}
    ${orderId}                      get value from json              ${Json_data}                    $.orderId
    set global variable             ${ORDER_ID}                      ${orderId[0]}











Run Get a single order before Update
    ${headers}=                     Create Dictionary                Authorization=Bearer ${BEARER_TOKEN}
    ${response}                     GET                              ${BASE_URL}/orders/${ORDER_ID}            headers=${headers}
    status should be                200
    should be equal as strings      ${ORDER_ID}                      ${response.json()}[id]
    should be equal as integers     4875                             ${response.json()}[toolId]
    should be equal as strings      ${FULL_NAME}                     ${response.json()}[customerName]
    should not be true              ${response.json()}[processed]
    should be empty                 ${response.json()}[comment]


Run Get a single order After Update
    ${headers}=                     Create Dictionary                Authorization=Bearer ${BEARER_TOKEN}
    ${response}                     GET                              ${BASE_URL}/orders/${ORDER_ID}            headers=${headers}
    status should be                200
    should be equal as strings      ${ORDER_ID}                      ${response.json()}[id]
    should be equal as integers     4875                             ${response.json()}[toolId]
    should be equal as strings      ${FULL_NAME}                     ${response.json()}[customerName]
    should not be true              ${response.json()}[processed]
    should be equal as strings      call me one order ready          ${response.json()}[comment]


Run Get a single order After Deledte
    ${headers}=                     Create Dictionary                Authorization=Bearer ${BEARER_TOKEN}
    ${response}                     GET                              ${BASE_URL}/orders/${ORDER_ID}            headers=${headers}       expected_status=404
    should be equal as strings      No order with id ${ORDER_ID}.    ${response.json()}[error]




Run Get a single order
    [Arguments]                     ${verify_order_details}
    ${headers}                      set API Auth
    IF  '${verify_order_details}' == 'CREATED ORDER' or '${verify_order_details}' == 'UPDATED ORDER'
        ${response}                     GET                                 ${BASE_URL}/orders/${ORDER_ID}         headers=${headers}           expected_status=200
        should be equal as strings      ${ORDER_ID}                         ${response.json()}[id]
        should be equal as integers     4875                                ${response.json()}[toolId]
        should be equal as strings      ${FULL_NAME}                        ${response.json()}[customerName]
        should not be true              ${response.json()}[processed]
    ELSE
        ${response}                     GET                                 ${BASE_URL}/orders/${ORDER_ID}         headers=${headers}           expected_status=404
        should be equal as strings      No order with id ${ORDER_ID}.       ${response.json()}[error]
    END
    IF  '${verify_order_details}' == 'CREATED ORDER'
         should be empty                                                    ${response.json()}[comment]
    ELSE IF  '${verify_order_details}' == 'UPDATED ORDER'
         should be equal as strings      call me one order ready            ${response.json()}[comment]
    END








Run Update an order
    ${json_data}                    create dictionary                comment=call me one order ready
    ${headers}                      set API Auth
    ${response}                     PATCH                            ${BASE_URL}/orders/${ORDER_ID}            headers=${headers}       json=${json_data}       expected_status=204













Run Delete an order
    ${headers}                      set API Auth
    ${response}                     DELETE                           ${BASE_URL}/orders/${ORDER_ID}            headers=${headers}
    status should be                204











set API Auth
    ${headers}=           Create Dictionary                Authorization=Bearer ${BEARER_TOKEN}
    [Return]              ${headers}





Created Data For Register a new API client
    ${first_name}           generate random string              8    [LOWER]
    ${last_name}            generate random string              8    [LOWER]
    set global variable     ${EMAIL}                            ${first_name}.${last_name}@gmail.com




Created Data For new Order
    ${first_name}           generate random string           8    [LOWER]
    ${last_name}            generate random string           8    [LOWER]
    set global variable     ${FULL_NAME}                     ${first_name} ${last_name}
    ${json_data}            create dictionary                toolId=4875                     customerName=${first_name} ${last_name}
    [Return]                ${json_data}