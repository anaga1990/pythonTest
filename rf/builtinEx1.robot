*** Settings ***



# robot -d reports ./rf/builtinEx1.robot
*** Test Cases ***
Get OS Details
    ${data}   evaluate    platform.system()    platform
    log to console    ${data}



test list
    @{car} =                        create list     tata        honda       bmw
    log                             ${car}
    ${count}                        get count       ${car}      tata
    log                             ${count}
    ${length}                       get length      ${car}
    log                             ${length}
    should be equal as integers     3               ${length}
    should be equal as numbers      3               ${length}
    ${data}                         convert to string               123
    convert to number               ${data}
    log                             ${data}

get Time
    ${date1} =	Get Time	year	NOW
    log to console          ${date1}
    ${date2} =	Get Time    year month day hour min sec
    log to console          ${date2}
    ${date3} =	Get Time
    log to console          ${date3}
    ${date4} =	Get Time    UTC - 1 hour
    log to console          ${date4}
    ${date5} =	Get Time    year month day hour min sec     UTC - 1 hour
    log to console          ${date5}
    ${date6} =	Get Time    year month day hour min sec     UTC
    log to console          ${date6}


Conditions IF
