*** Settings ***
Library    REST    ssl_verify=false
Library    Collections
Library    String
Library    JSONLibrary
#Resource   ./../RequestsLibrary-API/SimpleToolRentalAPIV2.robot

*** Variables ***
${BASE_URL}=    https://simple-tool-rental-api.glitch.me
${BEARER_TOKEN}
${FULL_NAME}
${ORDER_ID}
${EMAIL}

# robot -d reports ./Rest-API/ToolRentalAPI.robot
*** Test Cases ***


REST API TESTing
    [Tags]    api4
    Run REST Check API Application Status
    Run REST Get all tools
    Run REST Register a new API client
    Run REST Create a new order
    Run REST Get a single order              verify_order_details=CREATED ORDER
    Run REST Update an order
    Run REST Get a single order              UPDATED ORDER
    Run REST Delete an order
    Run REST Get a single order              DELETED ORDER

*** Keywords ***
Run REST Check API Application Status
    GET                                 ${BASE_URL}/status
    Output                              response body           also_console=False
    Integer                             response status         200
    String                              $.status                UP


Run REST Get all tools
    GET                                 ${BASE_URL}/tools
    ${response}                         Output                      response body                       also_console=False
    Integer                             response status             200
    Integer                             $[2].id                     2177
    String                              $[2].category               ladders
    String                              $[2].name                   Cosco Three Step Steel Platform
    ${category}                         get value from json         ${response}                         $[?(@.id==2177)].category
    should be equal                     ${category[0]}              ladders
    ${x}                                get length                  ${response}
    log to console                      ==> ${x}


Run REST Register a new API client
    Created Data For Register a new API client
    ${request_Data}                     create dictionary            clientName=Postman                 clientEmail=${EMAIL}
    POST                                ${BASE_URL}/api-clients      body=${request_Data}
    Integer                             response status              201
    ${response}                         Output                       response body                      also_console=False
    ${bearerTokenVal}                   get value from json          ${response}                        $.accessToken
    set global variable                 ${BEARER_TOKEN}              ${bearerTokenVal[0]}


Run REST Create a new order
    ${request_Data}                 Created Data For new Order
    set rest Api Authentication
    POST                            ${BASE_URL}/orders               body=${request_Data}
    ${response}                     Output                           response body                   also_console=False
    Integer                         response status                  201
    Boolean                         $.created                        true
    String                          $.orderId
    ${orderId}                      get value from json              ${response}                     $.orderId
    set global variable             ${ORDER_ID}                      ${orderId[0]}


Run REST Get a single order
    [Arguments]                     ${verify_order_details}
    set rest Api Authentication
    IF  '${verify_order_details}' == 'CREATED ORDER' or '${verify_order_details}' == 'UPDATED ORDER'
        GET                             ${BASE_URL}/orders/${ORDER_ID}
        ${response}                     Output                              response body                   also_console=False
        Integer                         response status                     200
        String                          $.id                                ${ORDER_ID}
        Number                          $.toolId                           4875
        String                          $.customerName                      ${FULL_NAME}
        boolean                         $.processed                         false
    ELSE
        GET                             ${BASE_URL}/orders/${ORDER_ID}
        ${response}                     Output                              response body                   also_console=False
        Integer                         response status                     404
    END
    IF  '${verify_order_details}' == 'CREATED ORDER'
         String                         $.comment                           ""
    ELSE IF  '${verify_order_details}' == 'UPDATED ORDER'
         String                         $.comment                           call me one order ready
    END

Run REST Update an order
    ${json_data}                    create dictionary                comment=call me one order ready
    set rest Api Authentication
    PATCH                           ${BASE_URL}/orders/${ORDER_ID}   body=${json_data}
    ${response}                     Output                           response body                   also_console=False
    Integer                         response status                  204



Run REST Delete an order
    set rest Api Authentication
    DELETE                          ${BASE_URL}/orders/${ORDER_ID}
    ${response}                     Output                           response body                   also_console=False
    Integer                         response status                  204


set rest Api Authentication
     Set Headers                    { "authorization": "Bearer ${BEARER_TOKEN}"}


Created Data For Register a new API client
    ${first_name}           generate random string              8    [LOWER]
    ${last_name}            generate random string              8    [LOWER]
    set global variable     ${EMAIL}                            ${first_name}.${last_name}@gmail.com




Created Data For new Order
    ${first_name}           generate random string           5    [LOWER]
    ${last_name}            generate random string           8    [LOWER]
    set global variable     ${FULL_NAME}                     ${first_name} ${last_name}
    ${json_data}            create dictionary                toolId=4875                     customerName=${first_name} ${last_name}
    [Return]                ${json_data}