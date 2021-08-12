*** Settings ***
Documentation  This includes test cases related to People Management Application
Resource  ../Resources/PeopleRegistration_GUI/Common.robot
Resource  ../Resources/PeopleRegistration_GUI/PO/home_page.robot
Resource  ../Resources/PeopleRegistration_GUI/PO/peoplelist_page.robot
Resource  ../Resources/PeopleRegistration_GUI/PO/registration_page.robot
Test Setup  Begin web test
Test Teardown  End web test

*** Variables ***

*** Test Cases ***
Get registered people list
    [Documentation]  This test case verifies the list of people registered
    [Tags]  GUI
    home_page.Verify "People Management page" is loaded
    Sleep  1s
    home_page.Click on "List of People"
    Sleep  1s
    peoplelist_page.Verify "People list" page is loaded
    Sleep  1s
    peoplelist_page.Get Registered People list
    Sleep  1s

Register new people
    [Documentation]  This test case will register new people
    [Tags]  Register
    home_page.Verify "People Management page" is loaded
    home_page.Click on "Register new People"
    registration_page.Verify "New Registration" page is loaded
    Sleep  2s
    registration_page.Enter "First Name"   Mahendra
    registration_page.Enter "Middle Name"  Pratap
    registration_page.Enter "Family Name"  Baahubali
    registration_page.Enter "Date of Birth"  15/02/1992
    registration_page.Enter "Place of Birth"  Uthara
    registration_page.Enter "Nationality"  India
    registration_page.Click "Submit" button
    peoplelist_page.Verify "People list" page is loaded
    Sleep  1s

*** Keywords ***
