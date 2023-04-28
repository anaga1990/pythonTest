*** Settings ***
Library             SeleniumLibrary
Resource            ./../common/browserManager.robot

Test Setup          Open web browser                    ${GUI_URL}
Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0 S



# robot -d reports ./ui/differentActions/ExOfAlert.robot
# robot -d reports -t "Test Text with Alert Example" ./ui/differentActions/ExOfAlert.robot

*** Test Cases ***
Test Text with Alert Example
    #Open web browser                    ${GUI_URL}
    #input text                          id:name                         WGS         True
    click element                       //input[@id='confirmbtn']
    ${actual_alert_message}             handle alert                    ACCEPT
    log to console                      ${actual_alert_message}



