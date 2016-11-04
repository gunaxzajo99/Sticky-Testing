*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Signupไม่สำเร็จ(ไม่ได้กรอกUsername)
    [Setup]
    เปิดเว็บ
    กดปุ่มCreate
    ไม่กรอกUsername
    กดปุ่มSignup
    รอแสดงผลว่าfill your username.

Signupไม่สำเร็จ(ไม่ได้กรอกPassword)
    [Setup]
    ไม่กรอกPassword
    กดปุ่มSignup
    รอแสดงผลว่าfill your password.

Signupไม่สำเร็จ(ไม่ได้กรอกRepeatPassword)
    [Setup]
    ไม่กรอกRepeatPassword
    กดปุ่มSignup
    รอแสดงผลว่าrepeat your password.

Signupไม่สำเร็จ(กรอกUsernameซ้ำ)
    [Setup]
    กรอกUsernameซ้ำ
    กดปุ่มSignup
    รอแสดงผลว่าthis username is already in used.

Signupไม่สำเร็จ(กรอกUsernameถูกและช่องอื่นไม่ใส่อะไรเลย)
    [Setup]
    กรอกUsernameถูก
    กดปุ่มSignup
    รอแสดงผลว่าyou can use this username.

Signupไม่สำเร็จ(RepeatPasswordไม่ตรงกับPassword)
    [Setup]
    กรอกpasswordถูก
    กรอกRepeatPasswordผิด
    กดปุ่มSignup
    รอแสดงผลว่าYour password is not match.

Signupสำเร็จ
    [Setup]
    กรอกUsernameถูก
    กรอกpasswordถูก
    กรอกRepeatPasswordถูก
    กดปุ่มSignup
    รอแสดงผลว่าSign up successfully please wait
    รอแสดงผลว่าMy Lists
    ปิดเว็บ

*** Keywords ***
เปิดเว็บ
    Open Browser    https://angsila.cs.buu.ac.th/~57160438/887371/Sticky/    chrome

ปิดเว็บ
    Close Browser

กรอกUsernameถูก
    Input Text    id=username_signup    totaba1

ไม่กรอกUsername
    Input Text    id=username_signup    ${EMPTY}

กรอกUsernameซ้ำ
    Input Text    id=username_signup    admin

กรอกPasswordถูก
    Input Text    id=password_signup    1234

ไม่กรอกPassword
    Input Text    id=password_signup    ${EMPTY}

ไม่กรอกRepeatPassword
    Input Text    id=repeat_password_signup    ${EMPTY}

กรอกRepeatPasswordถูก
    Input Text    id=repeat_password_signup    1234

กรอกRepeatPasswordผิด
    Input Text    id=repeat_password_signup    12345

กดปุ่มSignUp
    Click Button    id=sign-up-btn

รอแสดงผลว่าSign up successfully please wait
    Wait Until Page Contains    Sign up Successfully please wait...

รอแสดงผลว่าthis username is already in used.
    Wait Until Page Contains    this username is already in used.

รอแสดงผลว่าyou can use this username.
    Wait Until Page Contains    you can use this username.

รอแสดงผลว่าfill your username.
    Wait Until Page Contains    fill your username.

รอแสดงผลว่าfill your password.
    Wait Until Page Contains    fill your password.

รอแสดงผลว่าrepeat your password.
    Wait Until Page Contains    repeat your password.

รอแสดงผลว่าYour password is not match.
    Wait Until Page Contains    your password is not match.

รอแสดงผลว่าMy Lists
    Wait Until Page Contains    My Lists

กดปุ่มCreate
    Click Link    id=signup-link
