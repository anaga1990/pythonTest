*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0.2 s

# robot -d reports ./ui/common/browserManager.robot


*** Keywords ***
Open web browser
    [Arguments]                     ${GUI_URL}
    set selenium speed              0.5 S
    open browser                    ${GUI_URL}    ${BROWSER}    options=add_experimental_option('excludeSwitches', ['enable-logging']); add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors"); add_experimental_option("detach", True)
    maximize browser window
    #set window size                 width=1920  height=1080
    delete all cookies
    set browser implicit wait       60 s
    set selenium implicit wait      10 s
    set selenium speed              ${TEST_SPEED}





