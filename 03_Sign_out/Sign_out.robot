*** Settings ***
Library           Selenium2Library

*** Test Cases ***
SignOut
    [Setup]
    เปิดเว็บ
    กรอกUsername
    กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าMy Lists
    กดชื่อตัวเอง
    กด Sign out
    รอแสดงผลว่าSign in
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

กดชื่อตัวเอง
    Click Link    xpath=//*[@id="stickyBar"]/ul/li/a

กด Sign out
    Click Link    id=sign-out

รอแสดงผลว่าSign in
    Wait Until Page Contains    Sign in
