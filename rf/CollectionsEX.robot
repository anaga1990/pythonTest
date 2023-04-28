*** Settings ***
Library    String
Library    Collections

*** Variables ***
@{car_list}=        Tata    Mahindra    Ford   Honda    Suzuki  kia
&{data}=             1=Tata    3=Mahindra      4=Skoda     2=Suzuki    5=Hyundai   6=Toyota

*** Test Cases ***
# robot -d reports -t "Test01" ./rf/CollectionsEX.robot
Test01
    log to console              ${car_list}
    append to list              ${car_list}                 bmw
    log to console              ${car_list}
    append to list              ${car_list}                 Toyota                      Renault         kia   Audi    Hyundai
    log to console              ${car_list}
    ${count}                    count values in list        ${car_list}                 kia
    log to console              "kia Count => ${count}
    ${x}                        get from list               ${car_list}                 0
    log to console              ${x}
    ${x}                        get from list               ${car_list}                 3
    log to console              ${x}
    ${x}                        get from list               ${car_list}                 -1
    log to console              ${x}
    ${x}                        get index from list         ${car_list}                 kia
    log to console              ${x}
    ${sub_list}                 get slice from list         ${car_list}                 ${x}
    log to console              ${sub_list}
    insert into list            ${sub_list}                 3                           kia
    log to console              ${sub_list}
    list should contain sub list                            ${car_list}                 ${sub_list}
    remove values from list     ${sub_list}                 kia
    log to console              ${sub_list}
    remove from list            ${sub_list}                 0
    log to console              ==>"remove from list" ${sub_list}
    list should contain sub list                            ${car_list}                 ${sub_list}
    log to console              ${sub_list}
    set list value              ${sub_list}                 0                           kia
    log to console              \n ${sub_list}
    reverse list                ${sub_list}
    log to console              \n ${sub_list}
    sort list                   ${sub_list}
    log to console              \n ${sub_list}







# &{data}=             1=Tata    3=Mahindra      4=Skoda     2=Suzuki    5=Hyundai   6=Toyota
# robot -d reports -t "Test02" ./rf/CollectionsEX.robot
Test02
    log to console                  ${data}
    ${k}                            get dictionary keys     ${data}
    log to console                  ${k}
    ${k}                            get dictionary keys     ${data}    sort_keys=False
    log to console                  ${k}
    ${v}                            get dictionary values   ${data}
    log to console                  ${v}
    ${v}                            get dictionary values   ${data}    sort_keys=False
    log to console                  ${v}
    ${pairData}                     get dictionary items    ${data}
    log to console                  ${pairData}
    ${pairData}                     get dictionary items    ${data}    sort_keys=False
    log to console                  ${pairData}
    set to dictionary               ${data}                 7          Honda
    log to console                  ${data}
    remove from dictionary          ${data}                 7          Honda
    log to console                  ${data}
    Pop From Dictionary             ${data}                 6
    log to console                  ${data}
