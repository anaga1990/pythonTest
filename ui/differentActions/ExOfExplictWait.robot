*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0.2 s



# robot -d reports ./ui/differentActions/ExOfExplictWait.robot
# robot -d reports -t "Test wait until page contains" ./ui/differentActions/ExOfExplictWait.robot
# robot -d reports -t "Test wait until page contains element" ./ui/differentActions/ExOfExplictWait.robot
# robot -d reports -t "Test wait until element contains" ./ui/differentActions/ExOfExplictWait.robot
# robot -d reports -t "Test wait until element does not contain" ./ui/differentActions/ExOfExplictWait.robot
# robot -d reports -t "Test wait until element is enabled" ./ui/differentActions/ExOfExplictWait.robot
# robot -d reports -t "Test wait until element is not visible" ./ui/differentActions/ExOfExplictWait.robot
# robot -d reports -t "Test wait until element is visible" ./ui/differentActions/ExOfExplictWait.robot

*** Test Cases ***
Test Explict wait Example
    Open web browser                    ${GUI_URL}
    wait until page contains
    wait until page contains element
    wait until element contains
    wait until element does not contain
    wait until element is enabled
    wait until element is not visible
    wait until element is visible
    wait for condition

Test wait until page contains
    open web browser                   https://www.letskodeit.com/practice
    wait until page contains           BMW                                 10 s
    click element                      id:bmwradio

Test wait until page contains element
    open web browser                    https://www.letskodeit.com/practice
    wait until page contains element    id:bmwradio                         1 ms                element not found with in time
    click element                       id:bmwradio

Test wait until element contains
    open web browser                    https://www.letskodeit.com/practice
    wait until element contains         //legend[normalize-space()='Checkbox Example']          Checkbox           1 s

Test wait until element does not contain
    open web browser                        https://www.letskodeit.com/practice
    wait until element does not contain     //legend[normalize-space()='Checkbox Example']     CheckboxSS           1 s
    click element                           //input[@id='benzradio']

Test wait until element is enabled
    open web browser                        https://www.letskodeit.com/practice
    #click element                           //input[@id='enabled-button']
    #click element                           //input[@id='disabled-button']
    wait until element is enabled           //input[@id='enabled-example-input']

Test wait until element is not visible
    open web browser                        https://www.letskodeit.com/practice
    click element                           //input[@id='hide-textbox']
    wait until element is not visible       //input[@id='displayed-text']               1 s

Test wait until element is visible
    open web browser                        https://www.letskodeit.com/practice
    wait until element is visible           //input[@id='displayed-text']               1 s