*** Settings ***



# robot -d reports ./rf/builtinEx1.robot
# robot -t "Get OS Details" ./rf/builtinEx1.robot
# robot ./rf/builtinEx1.robot
*** Test Cases ***
Get OS Details
    ${data}   evaluate    platform.system()    platform
    log to console    ${data}






# robot -t "test list" ./rf/builtinEx1.robot
test list
    @{car} =                        Create List         tata        honda       bmw     tata
    log                             ${car}
    ${count}                        get count           ${car}      tata
    log                             ${count}
    ${length}                       get length          ${car}
    log                             ${length}
    should be equal as integers     4                   ${length}
    should be equal as numbers      4                   ${length}
    ${data}                         convert to string               123
    log                             ${data}




























# robot -t "test Create Dictionary" ./rf/builtinEx1.robot
test Create Dictionary
    &{companys} =       create dictionary     1=wgs     2=wi    3=ng    one=1     True=data    1=XYZ
    log to console      ${companys}








# robot -t "get Time" ./rf/builtinEx1.robot
get Time
    ${date1} =	Get Time	year	NOW
    log many     date1=> ${date1}
    ${date2} =	Get Time    year month day hour min sec
    log to console          date2=> ${date2}
    ${date3} =	Get Time
    log to console          date3=>${date3}
    ${date4} =	Get Time    hour min sec                    UTC - 1 hour
    log to console          date4=>${date4}
    ${date5} =	Get Time    year month day hour min sec     UTC - 1 hour
    log to console          date5=>${date5}
    ${date6} =	Get Time    year month day hour min sec     UTC
    log to console          date6=>${date6}



