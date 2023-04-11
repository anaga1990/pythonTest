*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://www.letskodeit.com/practice
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0.5 s



# robot -d reports -t "Test mouse over Example" ./ui/differentActions/ExOfMouseOver.robot

*** Test Cases ***
Test mouse over Example
    Open web browser                    ${GUI_URL}
    sleep    1 s
    scroll element into view            //legend[normalize-space()='iFrame Example']
    mouse over                          //button[@id='mousehover']
    click link                          //a[normalize-space()='Top']
    sleep    5 s







