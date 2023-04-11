*** Settings ***
Library    SeleniumLibrary


# robot ./ui/browsers/letsOpenBrowsers.robot
*** Test Cases ***
Open Chrome
    open browser    url=https://rahulshettyacademy.com/AutomationPractice/    browser=chrome
    maximize browser window
    click element    //input[@value='radio1']

Open Chrome Diffrent Approach
    open browser    https://rahulshettyacademy.com/AutomationPractice/    chrome
    maximize browser window
    click element    //input[@value='radio3']

Open Edge
    open browser    url=https://rahulshettyacademy.com/AutomationPractice/    browser=Edge
    maximize browser window
    click element    //input[@value='radio1']

Open Edge Diffrent Approach
    open browser    https://rahulshettyacademy.com/AutomationPractice/    Edge
    maximize browser window
    click element    //input[@value='radio3']

Open Firefox
    open browser    url=https://rahulshettyacademy.com/AutomationPractice/    browser=Firefox
    maximize browser window
    click element    //input[@value='radio1']

Open Firefox Diffrent Approach
    open browser    https://rahulshettyacademy.com/AutomationPractice/    Firefox
    maximize browser window
    click element    //input[@value='radio3']