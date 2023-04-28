*** Settings ***


*** Variables ***

# robot -t "test for loop" ./rf/builtinEx2.robot
*** Test Cases ***
test for loop
     @{data} =      create list     2021    2022    2023
     FOR    ${x}    IN    @{data}
           log to console    ${x}
     END


























# robot -t "test for loop with IF conition" ./rf/builtinEx2.robot
test for loop with IF conition
     @{data} =      create list     2021    2022    2023    2024    2025    2026
     FOR   ${x}    IN               @{data}
           IF    ${x} == 2022
                log to console    ${x}
           END
           log to console    out side IF Block
     END














# robot  -t "test for loop with IF conition with Break" ./rf/builtinEx2.robot
test for loop with IF conition with Break
     @{data} =      create list     2021    2022    2023    2024    2025    2026
     FOR    ${x}    IN    @{data}
           IF    ${x} == 2022
                log to console    ===> ${x}
                BREAK
           END
           log to console    \n out side IF Block  ${x}
     END
     log to console     we are out from For loop













# robot -d reports -t "test for loop with IF conition with Continue" ./rf/builtinEx2.robot
test for loop with IF conition with Continue
     @{data} =      create list     2021    2022    2023    2024    2025    2026    2022
     FOR    ${x}    IN    @{data}
           IF    ${x} == 2022
                log to console    =======> ${x}
                CONTINUE
           END
           comment    action 1
           comment    action 2
           comment    action 3
           comment    action 4
           comment    action 5
           log to console    \n out side IF Block ${x}
     END






# robot -d reports -t "test for loop with IF conition and Continue in one Line" ./rf/builtinEx2.robot
test for loop with IF conition and Continue in one Line
     @{data} =      create list     2021    2022    2023    2024    2025    2026
     FOR    ${x}    IN    @{data}
           IF    ${x} == 2022    log to console     ====> ${x}      CONTINUE
           log to console    ${x}
     END
















# robot -d reports -t "test for loop with continue for loop if" ./rf/builtinEx2.robot
test for loop with continue for loop if
     @{data} =      create list     2021    2022    2023    2024    2025    2026
     FOR    ${x}    IN    @{data}
           continue for loop if   ${x} == 2023
           log to console  ${x}
     END















# robot -d reports -t "A simple while loop" ./rf/builtinEx2.robot
A simple while loop
    WHILE    True
        log to console    Executed until the default loop limit (10000) is hit.
    END


# robot -d reports -t "while Loop with default limit (10000) is hit" ./rf/builtinEx2.robot
while Loop with default limit (10000) is hit
    TRY
        WHILE    True
            log to console   Executed until the default loop limit (10000) is hit.
        END
    EXCEPT    WHILE loop was aborted    type=start
        log to console   The loop did not finish within the limit.
    END

# robot -d reports -t "WHILE Loop with given limit is hit" ./rf/builtinEx2.robot
WHILE Loop with given limit is hit
    TRY
        WHILE    True    limit=10
            log to console    Executed until the given loop limit (10) is hit.
        END
    EXCEPT    WHILE loop was aborted    type=start
        log to console    The loop did not finish within the limit.
    END



# robot -d reports -t "WHILE Loop condition evaluates to True or the default loop limit is hit" ./rf/builtinEx2.robot
WHILE Loop condition evaluates to True or the default loop limit is hit
    [Tags]    while_loops_with_Conduition
    ${x}=    Set Variable    ${0}
    WHILE    ${x} <= 3
        log to console    Executed as long as the condition is True ${x}.
        ${x}=    evaluate    ${x} + 1
    END