*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://www.letskodeit.com/practice
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0.5 s



# robot -d reports ./ui/differentActions/ExOfHandlingPopUpOrTab.robot
# robot -d reports -t "Test print PopUp Or Tab Example" ./ui/differentActions/ExOfHandlingPopUpOrTab.robot
# robot -d reports -t "Test Action on PopUp Example" ./ui/differentActions/ExOfHandlingPopUpOrTab.robot
# robot -d reports -t "Test Action on Tab Example" ./ui/differentActions/ExOfHandlingPopUpOrTab.robot
# robot -d reports -t "Test handling popup or tab Example" ./ui/differentActions/ExOfHandlingPopUpOrTab.robot

*** Test Cases ***
Test print PopUp Or Tab Example
    Open web browser                    ${GUI_URL}
    ${parent_window_title}              get window titles
    click element                       //button[@id='openwindow']
    ${get_all_windows}                  get window handles
    FOR    ${x}   IN    @{get_all_windows}
           log to console    ${x}
    END


Test Action on PopUp Example
    Open web browser                    ${GUI_URL}
    ${parent_window_title}              get window titles
    click element                       //button[@id='openwindow']
    ${get_all_windows}                  get window handles
    switch window                       NEW
    wait until page contains            HOME
    maximize browser window
    ${child_window_title}               get window titles
    ${actual_text}                      get text                            //span[contains(text(),'Become A Test Automation')]
    close window
    switch window                       MAIN
    click element                       //input[@id='bmwcheck']

Test Action on Tab Example
    Open web browser                    ${GUI_URL}
    ${parent_window_title}              get window titles
    click element                       //a[@id='opentab']
    ${get_all_windows}                  get window handles
    switch window                       NEW
    wait until page contains            HOME
    maximize browser window
    ${child_window_title}               get window titles
    ${actual_text}                      get text                            //span[contains(text(),'Become A Test Automation')]
    close window
    switch window                       MAIN
    click element                       //input[@id='bmwcheck']


Test handling popup or tab Example
    Open web browser                    ${GUI_URL}
    ${parent_window_title}              get window titles
    click element                       //a[@id='opentab']
    switched to new window
    click element                       //a[normalize-space()='ALL COURSES']
    close window
    switch window                       MAIN
    click element                       //input[@id='bmwcheck']


*** Keywords ***
switched to new window
    ${listOfwindows}=                   Get Window Handles
    ${NumberOfWindows}=                 Get Length                              ${listOfwindows}
    wait for condition                  return ${NumberOfWindows} == 2          60 s
    switch window                       NEW
    maximize browser window






