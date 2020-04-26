*** Settings ***
Library     SeleniumExtensions    WITH NAME    SeleniumLibrary
Resource    ${PROJECT_ROOT}${/}resources${/}Login.robot

*** Variables ***
${HOST_URL}    https://${FB_PROJECT}.web.app/
${HEADLESS}    True

*** Keywords ***
Open chrome browser
    [Arguments]   ${url}
    ${chrome_options}=     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #BuiltIn.Call Method    ${chrome_options}    add_argument    --start-fullscreen
    BuiltIn.Call Method    ${chrome_options}    add_argument    --allow-running-insecure-content
    BuiltIn.Call Method    ${chrome_options}    add_argument    --disable-web-security
    BuiltIn.Call Method    ${chrome_options}    add_argument    --no-sandbox
  #  BuiltIn.Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Run Keyword if    "${HEADLESS}" == "True"      BuiltIn.Call Method    ${chrome_options}    add_argument    --headless
    Create WebDriver   Chrome   chrome_options=${chrome_options}
    Set Selenium Timeout	10 seconds
    Go to   ${url}

Open roster
    Open chrome browser    ${HOST_URL}
    Location should be     ${HOST_URL}

Wait and click element
    [Arguments]   ${locator}
    Wait until page contains element    ${locator}
    Click element                       ${locator}
