*** Settings ***
Library           Selenium2Library

*** Test Cases ***
เขียนWrite todo ไม่สำเร็จ(ไม่ได้กรอก)
    [Setup]
    เปิดเว็บ
    กรอกUsername
    กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าMy Lists
    ไม่เติมข้อความลง write todo
    กดEnter
    ไม่แสดงผล

เขียนWrite todo สำเร็จ
    เติมข้อความลงwrite todo
    กดEnter
    รอแสดงผลว่าไปเที่ยว
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

ไม่เติมข้อความลง write todo
    Input Text    id=topic_todo    ${EMPTY}

เติมข้อความลง write todo
    Input Text    id=topic_todo    ไปเที่ยว

กดEnter
    Press Key    id=topic_todo    \\13

ไม่แสดงผล
    Page Should Not Contain Element    //*[@id="a_todo_list_162"]

รอแสดงผลว่าไปเที่ยว
    Sleep    1s
    ${val} =    Selenium2Library.Get Value    id=a_todo_list_162
    Should Be True    '${val}'=='ไปเที่ยว'
