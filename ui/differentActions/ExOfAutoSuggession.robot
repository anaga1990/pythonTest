*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0.5 s



# robot -d reports ./ui/differentActions/ExOfAutoSuggession.robot
# robot -d reports -t "Test AutoSuggession Example" ./ui/differentActions/ExOfAutoSuggession.robot

*** Test Cases ***
Test AutoSuggession Example
    Open web browser                    ${GUI_URL}
    input text                          //input[@id='autocomplete']             ind
    ${WebElements}                      Get WebElements                         //ul/li[@class='ui-menu-item']/div
    FOR   ${Element}    IN       @{WebElements}
          log to console    ${Element.text}
          IF     '${Element.text}' == 'India'
                  click element     ${Element}
                  BREAK
          END
    END







