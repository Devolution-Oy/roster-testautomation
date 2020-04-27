*** Settings ***
Documentation    User info editing test cases
Resource         ${PROJECT_ROOT}${/}resources${/}Setup.robot

Suite Teardown   Close All Browsers
Force Tags       set-edit-user-info   not-ready

*** Variables ***
${EDITED_USER_NAME}   Edited User
${EDITED_EMAIL}       Edited@devolution.fi
${ORIGINAL_NAME}      Devolution Tester
${ORIGINAL_EMAIL}     roster.test@devolution.fi

*** Test Cases ***
User can edit own user information
    GIVEN User is logged in
    WHEN User edit own information    ${EDITED_USER_NAME}    ${EDITED_EMAIL}
    THEN New user info is saved into database
    [Teardown]   Revert user info

# TODO: Add test case for cancel

# TODO: Add test case for unconfirm

*** Keywords ***
New user info is saved into database
    Reload page
    Page should contain element    xpath=.//label[@id='user_name' and text()='${EDITED_USER_NAME}']
    Page should contain element    xpath=.//label[@id='user_email']
    Page should contain element    xpath=.//label[@id='user_github']
    Page should contain element    xpath=.//label[@id='user_role']
    Page should contain element    xpath=.//button[@id='btn_edit_user']

Save and confirm edit
    Click element    xpath=.//button[@id='btn_save_user']
    Wait and click element    xpath=.//button[@id='btn_confirm_edit']

User is logged in
    Github login
    User info are shown

User info are shown
    Page should contain element    xpath=.//label[@id='user_name']
    Page should contain element    xpath=.//label[@id='user_email']
    Page should contain element    xpath=.//label[@id='user_github']
    Page should contain element    xpath=.//label[@id='user_role']
    Page should contain element    xpath=.//button[@id='btn_edit_user']

User edit own information
    [Documentation]    Assume that user page is shown
    [Arguments]   ${name}    ${email}
    SeleniumLibrary.Click element       xpath=.//button[@id='btn_edit_user']
    Wait until page contains element    xpath=.//input[@id='edit_user_name']
    Input text    xpath=.//input[@id='edit_user_name']     ${name}
    Input text    xpath=.//input[@id='edit_user_email']    ${email}
    Page should contain element    xpath=.//input[@id='edit_user_role' and @disabled]
    Page should contain element    xpath=.//input[@id='edit_user_github' and @disabled]
    Page should contain element    xpath=.//button[@id='btn_cancel_edit']
    Save and confirm edit

Revert user info
    User edit own information    ${ORIGINAL_NAME}    ${ORIGINAL_EMAIL}
    # TODO: Add Firebase python library and call addUser from there

