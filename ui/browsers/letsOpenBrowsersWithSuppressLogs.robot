*** Settings ***
Library    SeleniumLibrary


# robot -d reports ./ui/browsers/letsOpenBrowsersWithSuppressLogs.robot
# robot -d reports -t "Open Firefox" ./ui/browsers/letsOpenBrowsersWithSuppressLogs.robot
*** Test Cases ***
Open Chrome
    open browser                    https://rahulshettyacademy.com/AutomationPractice/    chrome
    ...  options=add_experimental_option('excludeSwitches', ['enable-logging']); add_argument("--ignore-certificate-errors"); add_experimental_option("detach", True)
    maximize browser window
    click element                   //input[@value='radio1']
    #close browser


Open Edge
    open browser                    https://rahulshettyacademy.com/AutomationPractice/    Edge      options=add_experimental_option('excludeSwitches', ['enable-logging']); add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors"); add_experimental_option("detach", True)
    maximize browser window
    click element                   //input[@value='radio2']
    close browser


Open Firefox
    open browser                    https://rahulshettyacademy.com/AutomationPractice/    Firefox
    maximize browser window
    click element                   //input[@value='radio3']
    close browser

