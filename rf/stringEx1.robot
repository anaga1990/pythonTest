*** Settings ***
Library    String

*** Test Cases ***
# robot -d reports -t "Test01" ./rf/stringEx1.robot
Test01
    ${x}=   convert to lower case    WgS TestING
    log to console    ${x}

# robot -d reports -t "Test02" ./rf/stringEx1.robot
Test02
    ${x}=   convert to upper case    WgS TestING
    log to console    ${x}

# robot -d reports -t "Test03" ./rf/stringEx1.robot
Test03
    ${x}=   generate random string      12	 [LOWER]
    log to console    ${x}


# robot -d reports -t "Test04" ./rf/stringEx1.robot
Test04
    ${x}=   generate random string      12	 [UPPER]
    log to console    ${x}

# robot -d reports -t "Test05" ./rf/stringEx1.robot
Test05
    ${x}=   generate random string      8	 [LETTERS]
    log to console    ${x}

# robot -d reports -t "Test06" ./rf/stringEx1.robot
Test06
    ${x}=   generate random string      8-10	 [LETTERS]
    log to console    ${x}

# robot -d reports -t "Test07" ./rf/stringEx1.robot
Test07
    ${x}=   generate random string      2-4	 [NUMBERS]
    log to console    ${x}

# robot -d reports -t "Test08" ./rf/stringEx1.robot
Test08
    ${x}=   generate random string      6	 [NUMBERS]
    log to console    ${x}

# robot -d reports -t "Test09" ./rf/stringEx1.robot
Test09
    ${x}=   generate random string                      10	    [NUMBERS]
    log to console          ${x}
    ${get_firstElement}     get substring               ${x}    0   1
    log to console          ${get_firstElement}
    ${get_2Element}         get substring               ${x}    1   2
    log to console          ${get_2Element}
    ${get_SubElement}       get substring               ${x}    0   5
    log to console          ${get_SubElement}

# robot -d reports -t "Test10" ./rf/stringEx1.robot
Test10
    ${result} =    Replace String Using Regexp    Robot Framework    f.*k    Class
    log to console          ${result}
    log to console          "******************************************************"
    ${result} =    Replace String Using Regexp    Robot Framework    f.*k    Class      flags=IGNORECASE

# robot -d reports -t "Test11" ./rf/stringEx1.robot
Test11
    @{result} =    split string    RF_STRING_TEST_EX    _
    log to console          ${result}