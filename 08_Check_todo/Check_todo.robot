*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Check todo สำเร็จ
    [Setup]
    เปิดเว็บ
    กรอกUsername
    กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าMy Lists
    ติ๊กช่องสี่เหลี่ยมหน้า Buy Cola ที่อยู่ในส่วนของ Undone
    ตรวจสอบสี่เหลี่ยมหน้า Buy Cola ที่อยู่ในส่วนของ Completes
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

ติ๊กช่องสี่เหลี่ยมหน้า Buy Cola ที่อยู่ในส่วนของ Undone
    Select Checkbox    id=a_todo_list_91

ตรวจสอบสี่เหลี่ยมหน้า Buy Cola ที่อยู่ในส่วนของ Completes
    Page Should Contain Element    id=todo_91
