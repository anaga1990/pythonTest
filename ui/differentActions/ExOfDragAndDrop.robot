*** Settings ***
Library             SeleniumLibrary
Resource            ../common/browserManager.robot

Test Teardown       close browser

*** Variables ***
${GUI_URL}=         https://jqueryui.com/droppable/
${BROWSER}=         chrome
${HEDA_LESS} =      False
${TEST_SPEED}=      0.5 s



# robot -d reports -t "Test Drag And Drop Example" ./ui/differentActions/ExOfDragAndDrop.robot

*** Test Cases ***
Test Drag And Drop Example
    Open web browser                    ${GUI_URL}
    sleep    1 s
    select frame                        //iframe
    drag and drop                       css:#draggable      css:#droppable
    sleep    2 s







