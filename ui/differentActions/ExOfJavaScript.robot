*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0.2 s



# robot -d reports ./ui/differentActions/ExOfJavaScript.robot
# robot -d reports -t "Test JavaScript Example" ./ui/differentActions/ExOfJavaScript.robot

*** Test Cases ***
Test JavaScript Example
    Open web browser                    ${GUI_URL}
    execute javascript                  window.scrollTo(0,document.body.scrollHeight)
    sleep    2 s
    execute javascript                  window.scrollTo(0,-document.body.scrollHeight)
    execute javascript                  document.getElementById("checkBoxOption1").click();
    sleep    2 s
    execute javascript                  window.scrollTo(0,200)
    sleep    2 s
    execute javascript                  window.scrollBy(0,150)
    sleep    2 s
    execute javascript                  window.scrollBy(0,150)
    sleep    500 ms
    execute javascript                  window.scrollBy(0,150)
    execute javascript                  window.scrollBy(0,150)


