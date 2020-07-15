*** Settings ***
Documentation    Login test cases
Resource         ${PROJECT_ROOT}${/}resources${/}Setup.robot

Suite Teardown   Close All Browsers
Force Tags       set-login

*** Test Cases ***
Github user can sign in
  GIVEN Open roster
  WHEN Github login
  THEN User details are shown in user page
  [Teardown]   Logout from roster
 
*** Keywords ***
User details are shown in user page
    Wait until page contains element    xpath=.//div[@id='user_page']
    Location should be     ${HOST_URL}user
