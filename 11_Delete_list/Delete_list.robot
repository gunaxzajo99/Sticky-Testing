*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Delete list สำเร็จ
    [Setup]
    เปิดเว็บ
    กรอกUsername
    กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าMy Lists
    กดเครื่องหมาย กากบาก ในช่อง List ชื่อ Supermarket
    ตรวจสอบ List ที่ลบไป
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

กดเครื่องหมาย กากบาก ในช่อง List ชื่อ Supermarket
    Mouse Over    xpath=//*[@id="list"]/li[3]/a
    Click Element    id=del_list4

ตรวจสอบ List ที่ลบไป
    Wait Until Page Does Not Contain Element    name=Supermarket
