*** Settings ***
Library           Selenium2Library

*** Test Cases ***
SignInไม่สำเร็จ(ไม่ได้กรอกUsername)
    [Setup]
    เปิดเว็บ
    ไม่กรอกUsername
    กรอกPasswordถูก
    กดปุ่มSignIn
    รอแสดงผลว่าPlease fill your username.

SignInไม่สำเร็จ(ไม่ได้กรอกPassword)
    [Setup]
    กรอกUsernameถูก
    ไม่กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าPlease fill your password.

SignInไม่สำเร็จ(ไม่ได้กรอกUsernameและPassword)
    [Setup]
    ไม่กรอกUsername
    ไม่กรอกPassword
    กดปุ่มSignIn
    รอแสดงผลว่าPlease fill your username.
    รอแสดงผลว่าPlease fill your password.

SignInไม่สำเร็จ(Usernameผิด)
    [Setup]
    กรอกUsernameผิด
    กรอกPasswordถูก
    กดปุ่มSignIn
    รอแสดงผลว่าPlease check your username and password.

SignInไม่สำเร็จ(Passwordผิด)
    [Setup]
    กรอกUsernameถูก
    กรอกPasswordผิด
    กดปุ่มSignIn
    รอแสดงผลว่าPlease check your username and password.

SignInไม่สำเร็จ(UsernameผิดและPasswordผิด)
    [Setup]
    กรอกUsernameผิด
    กรอกPasswordผิด
    กดปุ่มSignIn
    รอแสดงผลว่าPlease check your username and password.

SignInสำเร็จ
    [Setup]
    กรอกUsernameถูก
    กรอกPasswordถูก
    กดปุ่มSignIn
    รอแสดงผลว่าSign in successfully.
    รอแสดงผลว่าMy Lists
    ปิดเว็บ

*** Keywords ***
เปิดเว็บ
    Open Browser    https://angsila.cs.buu.ac.th/~57160438/887371/Sticky/    chrome

ปิดเว็บ
    Close Browser

กรอกUsernameถูก
    Input Text    id=username    guest

ไม่กรอกUsername
    Input Text    id=username    ${EMPTY}

กรอกUsernameผิด
    Input Text    id=username    gggg

กรอกPasswordถูก
    Input Text    id=password    123

ไม่กรอกPassword
    Input Text    id=password    ${EMPTY}

กรอกPasswordผิด
    Input Text    id=password    000

กดปุ่มSignIn
    Click Button    id=sign-in-btn

รอแสดงผลว่าSign in successfully.
    Wait Until Page Contains    Sign in successfully.

รอแสดงผลว่าPlease fill your username.
    Wait Until Page Contains    Please fill your username.

รอแสดงผลว่าPlease fill your password.
    Wait Until Page Contains    Please fill your password.

รอแสดงผลว่าPlease check your username and password.
    Wait Until Page Contains    Please check your username and password.

รอแสดงผลว่าMy Lists
    Wait Until Page Contains    My Lists
