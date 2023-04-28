*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://www.letskodeit.com/practice
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      1 s



# robot -d reports -t "Test mouse over Example" ./ui/differentActions/ExOfMouseOver.robot

*** Test Cases ***
Test mouse over Example
    Open web browser                    ${GUI_URL}
    scroll element into view            //legend[normalize-space()='iFrame Example']
    mouse over                          //button[@id='mousehover']
    click link                          //a[normalize-space()='Top']
    sleep    2 s







