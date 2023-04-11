*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0.2 s



# robot -d reports ./ui/differentActions/ExOfDropDown.robot
# robot -d reports -t "Test DropDown Example" ./ui/differentActions/ExOfDropDown.robot

*** Test Cases ***
Test DropDown Example
    Open web browser                    ${GUI_URL}
    select from list by value           //select[@id='dropdown-class-example']          option1
    select from list by index           //select[@id='dropdown-class-example']          0
    select from list by label           //select[@id='dropdown-class-example']          Option2


