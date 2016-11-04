*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Unchecked todo สำเร็จ
    [Setup]
    เปิดเว็บ
    กรอกUsername
    กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าMy Lists
    เอา Check ที่ช่องสี่เหลี่ยมหน้า Buy Cola ที่อยู่ในส่วนของ Completes ออก
    ตรวจสอบสี่เหลี่ยมหน้า Buy Cola ที่อยู่ในส่วนของ Undone
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

เอา Check ที่ช่องสี่เหลี่ยมหน้า Buy Cola ที่อยู่ในส่วนของ Completes ออก
    Unselect Checkbox    //*[@id="todo_91"]/div/label/input

ตรวจสอบสี่เหลี่ยมหน้า Buy Cola ที่อยู่ในส่วนของ Undone
    Page Should Contain Element    xpath=//*[@id="a_todo_list_91"]
