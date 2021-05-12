*** Settings ***
Library    SeleniumLibrary
Test Setup         Open Browser     ${link}      ${browser}
Test Teardown      Close Browser

*** Variable ***
${link}          https://opensource-demo.orangehrmlive.com/
${browser}       Firefox

*** Test Cases ***    
Login test with valid credential   
    [Tags]     Smoke
    Maximize Browser Window
    Enter txtUsername
    Enter txtPassword
    Click on the login Button
    Verify dashboard for User
    Verify logout from the application

*** Keywords ***
Enter txtUsername  
    Input Text       id=txtUsername       Admin

Enter txtPassword
    Input Text       name=txtPassword     admin123

Click on the login Button
    Click Button     xpath://input[@value='LOGIN']

Verify dashboard for User
    ${url}       Get Location
    Log To Console          ${url}
    Should Contain        ${url}      dashboard

Verify logout from the application
    Click Link      partial link=Welcome
    Sleep   10s
    Click Link      link:Logout
