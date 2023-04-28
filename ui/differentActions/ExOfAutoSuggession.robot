*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0 s



# robot -d reports ./ui/differentActions/ExOfAutoSuggession.robot
# robot -d reports -t "Test AutoSuggession Example" ./ui/differentActions/ExOfAutoSuggession.robot

*** Test Cases ***
Test AutoSuggession Example
    Open web browser                    ${GUI_URL}
    input text                          //input[@id='autocomplete']             in
    ${WebElements}                      Get WebElements                         //ul/li[@class='ui-menu-item']/div
    FOR   ${Element}    IN       @{WebElements}
          #log to console    ${Element.text}
          #${x}              Get Text        ${Element}
          #log to console    ${x}
          IF     '${Element.text}' == 'India'
                  click element     ${Element}
                  sleep    2s
                  BREAK
          END
    END







