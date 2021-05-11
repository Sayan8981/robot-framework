*** Settings ***
Library    SeleniumLibrary
Test Setup         Open Browser     ${link}      ${browser}
Test Teardown      Close Browser

*** Variable ***
${link}          https://opensource-demo.orangehrmlive.com/
${browser}       headlessFirefox

*** Test Cases ***    
Login test with valid credential   
    [Tags]     Smoke
    Maximize Browser Window
    Input Text       id=txtUsername       admin
    Input Text       name=txtPassword     admin123
    Click Button     xpath://input[@value='LOGIN']
    ${url}       Get Location
    Log To Console          ${url}
    Should Contain        ${url}      dashboard

Login test with invalid credential   
    [Tags]      Regression
    Maximize Browser Window
    Input Text       id=txtUsername       admin
    Input Text       name=txtPassword     admin1234cls    
    Click Button     xpath://input[@value='LOGIN']
    ${url}       Get Location
    Log To Console          ${url}
    Should Contain        ${url}      dashboard
