*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0.5 s



# robot -d reports ./ui/differentActions/ExOfAlert.robot
# robot -d reports -t "Test Text with Alert Example" ./ui/differentActions/ExOfAlert.robot

*** Test Cases ***
Test Text with Alert Example
    Open web browser                    ${GUI_URL}
    input text                          //input[@id='name']             WGS         True
    click element                       //input[@id='confirmbtn']
    ${alert_message}                    handle alert                    ACCEPT
    log to console                      ${alert_message}



