*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Delete todo สำเร็จ
    [Setup]
    เปิดเว็บ
    กรอกUsername
    กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าMy Lists
    กดเครื่องหมาย กากบาก ในช่อง todo ชื่อ Buy Cola
    ตรวจสอบ Todo ที่ลบไป
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

กดเครื่องหมาย กากบาก ในช่อง todo ชื่อ Buy Cola
    Mouse Over    id=a_todo_list_91
    Click Element    xpath=//*[@id="del_91"]

ตรวจสอบ Todo ที่ลบไป
    Wait Until Element Is Not Visible    id=a_todo_list_91
