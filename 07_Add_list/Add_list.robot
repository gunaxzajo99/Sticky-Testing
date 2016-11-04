*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Add list สำเร็จ
    [Setup]
    เปิดเว็บ
    กรอกUsername
    กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าMy Lists
    พิมข้อความลงบน +Add list
    กด Enter
    ตรวจสอบข้อความที่แสดงขึ้นมาว่าเป็น Trip
    ไม่พิมพ์อะไรบน +Add list
    ตรวจสอบว่าไม่มี list ใหม่เกิดขึ้น
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

พิมข้อความลงบน +Add list
    Input Text    id=add_list    Trip

กด Enter
    Press Key    id=add_list    \\13

ตรวจสอบข้อความที่แสดงขึ้นมาว่าเป็น Trip
    Wait Until Page Contains    Trip

ไม่พิมพ์อะไรบน +Add list
    Input Text    id=add_list    ${EMPTY}

ตรวจสอบว่าไม่มี list ใหม่เกิดขึ้น
    Page Should Not Contain Element    xpath=//*[@id="list"]/li[11]/a
