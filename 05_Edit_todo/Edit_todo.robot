*** Settings ***
Library           Selenium2Library

*** Test Cases ***
edit todo สำเร็จ
    [Setup]
    เปิดเว็บ
    กรอกUsername
    กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าMy Lists
    edit todo Buy orange juice
    Refresh หน้า
    ตรวจสอบหา Todo ที่แก้ไป
    ปิดเว็บ

*** Keywords ***
เปิดเว็บ
    Open Browser    https://angsila.cs.buu.ac.th/~57160438/887371/Sticky/    chrome

ปิดเว็บ
    Close Browser

กรอกUsername
    Input Text    id=username    guest

กรอกPassword
    Input Text    id=password    123

กดปุ่มSignIn
    Click Button    id=sign-in-btn

รอแสดงผลว่าMy Lists
    Wait Until Page Contains    My Lists

edit todo Buy orange juice
    Input Text    id=a_todo_list_91    Buy Cola

Refresh หน้า
    Press Key    id=topic_todo    \\116

ตรวจสอบหา Todo ที่แก้ไป
    Sleep    1s
    ${val} =    Selenium2Library.Get Value    id=a_todo_list_91
    Should Be True    '${val}'=='Buy Cola'
