*** Settings ***
Library           Selenium2Library

*** Test Cases ***
ค้นหา todo สำเร็จ
    [Setup]
    เปิดเว็บ
    กรอกUsername
    กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าMy Lists
    พิมข้อความลงบน write a todo ว่า ไปตลาด
    ตรวจสอบข้อความที่แสดงขึ้นมาว่า ไปตลาด
    ไม่พิมข้อความลงบน write a todo
    ดูว่าไม่มีอะไรเกิดขึ้น
    ปิดเว็บ

*** Keywords ***
เปิดเว็บ
    Open Browser    https://angsila.cs.buu.ac.th/~57160438/887371/Sticky/    chrome

ปิดเว็บ
    Close Browser

กรอกUsername
    Input Text    id=username    Kaijo

กรอกPassword
    Input Text    id=password    123

กดปุ่มSignIn
    Click Button    id=sign-in-btn

รอแสดงผลว่าMy Lists
    Wait Until Page Contains    My Lists

พิมข้อความลงบน write a todo ว่า ไปตลาด
    Input Text    id=topic_todo    ไปตลาด

ตรวจสอบข้อความที่แสดงขึ้นมาว่า ไปตลาด
    Page Should Contain    ไปตลาด
    Page Should Not Contain    Buy Cola

ไม่พิมข้อความลงบน write a todo
    Input Text    id=topic_todo    ${EMPTY}

ดูว่าไม่มีอะไรเกิดขึ้น
    ${val}=    Selenium2Library.Get Value    id=a_todo_list_159
    Should Be True    '${val}'=='Buy Cola'
