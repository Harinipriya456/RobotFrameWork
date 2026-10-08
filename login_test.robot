*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Timeout    30 seconds

*** Variables ***
${URL}        https://www.saucedemo.com/
${BROWSER}    Chrome
${USERNAME}   standard_user
${VALID_PASSWORD}    secret_sauce
${INVALID_PASSWORD}  wrong_password


*** Test Cases ***

Valid Password Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2 seconds
    Input Text    id=user-name    ${USERNAME}
    Sleep    2 seconds
    Input Password    id=password    ${VALID_PASSWORD}
    Sleep    2 seconds
    Click Button    id=login-button
    Sleep    2 seconds
    Wait Until Page Contains    Products
    Sleep    2 seconds
    Close Browser


Invalid Password Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2 seconds
    Input Text    id=user-name    ${USERNAME}
    Sleep    2 seconds
    Input Password    id=password    ${INVALID_PASSWORD}
    Sleep    2 seconds
    Click Button    id=login-button
    Sleep    2 seconds
    Wait Until Page Contains    Username and password do not match
    Sleep    2 seconds
    Close Browser