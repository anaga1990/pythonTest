*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0.2 s



# robot -d reports ./ui/differentActions/ExOfCheckBox.robot
# robot -d reports -t "Test CheckBox Example" ./ui/differentActions/ExOfCheckBox.robot

*** Test Cases ***
Test CheckBox Example
    Open web browser                    ${GUI_URL}
    checkbox should not be selected     //input[@id='checkBoxOption3']
    select checkbox                     //input[@id='checkBoxOption3']
    checkbox should be selected         //input[@id='checkBoxOption3']
    unselect checkbox                   //input[@id='checkBoxOption3']
    checkbox should not be selected     //input[@id='checkBoxOption3']


