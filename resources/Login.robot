*** Variables ***
${ROSTER_USER}    devolution-roster-test

*** Keywords ***
Github login
    Wait and click element    xpath=.//div[@id='btn_github']
    Switch window    NEW
    Wait until page contains element    xpath=.//input[@id='login_field']
    Input text    xpath=.//input[@id='login_field']    ${ROSTER_USER}
    Input text    xpath=.//input[@id='password']    ${USER_PW}
    Click element    xpath=.//input[@type='submit']
    Capture page screenshot
    Sleep  5s
    Capture page screenshot
    Switch window    MAIN

Logout from roster
    Click element    xpath=.//button[@id='btn_logout']
