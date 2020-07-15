*** Variables ***
${ROSTER_USER}    roster.test@devolution.fi

*** Keywords ***
Github login
    Go to    ${HOST_URL}test_login
    Wait until page contains element    xpath=.//input[@id='login_field']
    Input text    xpath=.//input[@id='login_field']    ${ROSTER_USER}
    Input text    xpath=.//input[@id='password']    ${USER_PW}
    Click element    xpath=.//button[@type='submit']
    Wait until page contains element    xpath=.//div[@id='user_page']

Logout from roster
    Click element    xpath=.//button[@id='btn_logout']
