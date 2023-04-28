*** Settings ***
Library    SeleniumLibrary


# robot ./ui/browsers/letsOpenBrowsers.robot
# robot -t "Open Chrome" ./ui/browsers/letsOpenBrowsers.robot
*** Test Cases ***
Open Chrome
    open browser                url=https://rahulshettyacademy.com/AutomationPractice/    browser=chrome    options=add_experimental_option("detach", True)
    maximize browser window

    click element    //input[@value='radio2']
    sleep    2s
    close browser
























# robot -t "Open Chrome Diffrent Approach" ./ui/browsers/letsOpenBrowsers.robot
Open Chrome Diffrent Approach
    open browser    https://rahulshettyacademy.com/AutomationPractice/    chrome        executable_path=./libs/chromedriver.exe
    maximize browser window
    click element    //input[@value='radio3']


# robot -t "Open Edge" ./ui/browsers/letsOpenBrowsers.robot
Open Edge
    open browser    url=https://rahulshettyacademy.com/AutomationPractice/    browser=Edge  executable_path=./libs/msedgedriver.exe
    maximize browser window
    click element    //input[@value='radio1']

Open Edge Diffrent Approach
    open browser    https://rahulshettyacademy.com/AutomationPractice/    Edge
    maximize browser window
    click element    //input[@value='radio3']


# robot -t "Open Firefox" ./ui/browsers/letsOpenBrowsers.robot
Open Firefox
    open browser    url=https://rahulshettyacademy.com/AutomationPractice/    browser=Firefox
    maximize browser window
    click element    //input[@value='radio1']
    close browser

Open Firefox Diffrent Approach
    open browser    https://rahulshettyacademy.com/AutomationPractice/    Firefox
    maximize browser window
    click element    //input[@value='radio3']