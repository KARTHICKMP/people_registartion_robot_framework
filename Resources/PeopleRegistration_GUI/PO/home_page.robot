*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PEOPLE_MGNT_HEADING_XPATH} =  xpath=/html/body/div/h1
${LIST_OF_PEOPLE_XPATH} =  xpath=/html/body/div/h3[1]/a
${REGISTER_NEW_USER_XPATH} =  xpath=/html/body/div/h3[2]/a

*** Keywords ***
Get "People Management Page" header text
    [Documentation]  Get the text value of "People Management" header
    Get Text  ${PEOPLE_MGNT_HEADING_XPATH}

Get "List of People" text
    [Documentation]  Get text value of "List of People" link
    Get Text  ${LIST_OF_PEOPLE_XPATH}

Get "Register New User" text
    [Documentation]  Get text value of "Register New User" link
    Get Text  ${REGISTER_NEW_USER_XPATH}

Click on "List of People"
    [Documentation]  Click on "List of People" link
    Click Link  ${LIST_OF_PEOPLE_XPATH}

Click on "Register new People"
    [Documentation]  Click on "Register New User" link
    Click Link  ${REGISTER_NEW_USER_XPATH}

Verify "People Management page" is loaded
    [Documentation]  Verifies if "People Management" page is loaded
    Wait Until Page Contains Element  ${PEOPLE_MGNT_HEADING_XPATH}  2s  Home page is not loaded
