*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${GUI_URL}=         https://rahulshettyacademy.com/AutomationPractice/
${BROWSER_NAME}=    Edge
${HEAD_LESS} =      True
${TEST_SPEED}=      0 s



# robot -d reports ./ui/browsers/FrameworkOfHandlingBrowsers.robot
# robot -d reports -t "Test01" ./ui/browsers/FrameworkOfHandlingBrowsers.robot
*** Test Cases ***
Test01
    Open Custom Browser     ${BROWSER_NAME}
    close browser


*** Keywords ***
Open Custom Browser
    [Arguments]      ${BROWSER_NAME}
    set selenium speed              ${TEST_SPEED}
    ${BROWSER} =	                Convert To Lower Case	        ${BROWSER_NAME}
    IF      '${BROWSER}' == 'chrome'
        IF  ${HEAD_LESS}
            open browser
            ...     ${GUI_URL}
            ...     chrome
            ...     options=add_experimental_option('excludeSwitches', ['enable-logging']); add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors"); add_experimental_option("detach", True); add_argument("--headless")
        ELSE
            open browser
            ...     ${GUI_URL}
            ...     chrome
            ...     options=add_experimental_option('excludeSwitches', ['enable-logging']); add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors"); add_experimental_option("detach", True);
        END
    ELSE IF    '${BROWSER}' == 'edge'
        IF  ${HEAD_LESS}
            open browser
            ...     ${GUI_URL}
            ...     Edge
            ...     options=add_experimental_option('excludeSwitches', ['enable-logging']); add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors"); add_experimental_option("detach", True); add_argument("--headless")
        ELSE
            open browser
            ...     ${GUI_URL}
            ...     Edge
            ...     options=add_experimental_option('excludeSwitches', ['enable-logging']); add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors"); add_experimental_option("detach", True);
        END
    ELSE IF    '${BROWSER}' == 'firefox'
        IF  ${HEAD_LESS}
            open browser
            ...     ${GUI_URL}
            ...     Headless Firefox
        ELSE
            open browser
            ...     ${GUI_URL}
            ...     Firefox
        END
    END
    maximize browser window
    set window size                 width=1920  height=1080
    set browser implicit wait       60 seconds
    set selenium implicit wait      10 seconds
    click element                   //input[@value='radio1']
    capture page screenshot





