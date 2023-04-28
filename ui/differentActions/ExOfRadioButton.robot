*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot
Test Teardown       close browser
*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}=         chrome
${TEST_SPEED}=      .3 s



# robot -d reports ./ui/differentActions/ExOfRadioButton.robot
# robot -d reports -t "Test radioButtons Example1" ./ui/differentActions/ExOfRadioButton.robot
# robot -d reports -t "Test radioButtons Example2" ./ui/differentActions/ExOfRadioButton.robot
# robot -d reports -t "Test radioButtons Example3" ./ui/differentActions/ExOfRadioButton.robot
# robot -d reports -t "Test radioButtons Example4" ./ui/differentActions/ExOfRadioButton.robot
*** Test Cases ***
Test radioButtons Example1
    Open web browser                         ${GUI_URL}
    #radio button should be set to              radioButton      radio3
    radio button should not be selected         radioButton
    select radio button                         radioButton      radio3
    radio button should be set to               radioButton       radio3
    select radio button                         radioButton      radio1
    select radio button                         radioButton      radio2



Test radioButtons Example2
    Open web browser             https://rahulshettyacademy.com/angularpractice/
    scroll element into view        //input[@value='Submit']
    select radio button             inlineRadioOptions                      inlineRadio2
    select radio button             inlineRadioOptions                      inlineRadio1

Test radioButtons Example3
    Open web browser             https://www.letskodeit.com/practice
    select radio button             cars      bmwradio
    select radio button             cars      honda

Test radioButtons Example4
    Open web browser                     https://www.goibibo.com/
    wait until page contains element        //span[@role='presentation']                                10 s
    click element                           //span[@role='presentation']
    click element                           //span[text()='Round-trip']/preceding-sibling::span





