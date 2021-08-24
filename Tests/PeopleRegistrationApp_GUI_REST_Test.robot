*** Settings ***
Documentation  This suite includes tests related to REST API and GUI
Resource  ../Resources/PeopleRegistration_REST/PeopleRegistrationApp_REST.robot
Resource  ../Resources/PeopleRegistration_GUI/Common.robot
Resource  ../Resources/PeopleRegistration_GUI/PO/home_page.robot
Resource  ../Resources/PeopleRegistration_GUI/PO/peoplelist_page.robot
Resource  ../Resources/PeopleRegistration_GUI/PO/registration_page.robot
Library  DateTime
Test Setup  Begin web test
Test Teardown  End web test

*** Variables ***


*** Test Cases ***
Register new people via GUI and verify using REST API
    [Documentation]  The test case is to get all registered users
    [Tags]  Test_1
    ${first_name} =  Set variable  Mahendra
    ${middle_name} =  Set variable  Pratap
    ${family_name} =  Set variable  Baahubali
    ${dob} =  Set variable  11/15/1992
    ${place_of_birth} =  Set variable  Uthara
    ${nationality} =  Set variable  India
    home_page.Verify "People Management page" is loaded
    home_page.Click on "Register new People"
    registration_page.Verify "New Registration" page is loaded
    Sleep  2s
    registration_page.Enter "First Name"   ${first_name}
    registration_page.Enter "Middle Name"  ${middle_name}
    registration_page.Enter "Family Name"  ${family_name}
    registration_page.Enter "Date of Birth"  ${dob}
    registration_page.Enter "Place of Birth"  ${place_of_birth}
    registration_page.Enter "Nationality"  ${nationality}
    registration_page.Click "Submit" button
    peoplelist_page.Verify "People list" page is loaded
    Sleep  1s
    ${ret_response} =  PeopleRegistrationApp_REST.Get all registered people
    Log to console  ${ret_response.json()}[-1]
    ${poeple_info} =  Set Variable  ${ret_response.json()}[-1]
    PeopleRegistrationApp_REST.Delete registered people by id  ${poeple_info}[id]
    Log To Console  ${poeple_info}[firstName]
    Should Be Equal  ${poeple_info}[firstName]  ${first_name}
    Should Be Equal  ${poeple_info}[middleName]  ${middle_name}
    Should Be Equal  ${poeple_info}[familyName]  ${family_name}
    ${date1} =  Convert Date  ${dob}  date_format=%m/%d/%Y
    ${date2} =  Convert Date  ${poeple_info}[dOB]
    Should Be Equal  ${date1}  ${date2}
    Should Be Equal  ${poeple_info}[placeOfBirth]  ${place_of_birth}
    Should Be Equal  ${poeple_info}[nationality]  ${nationality}

Register new people via REST API and verify using GUI
    [Documentation]  The test case is to get all registered users
    [Tags]  Test_2
    ${first_name} =  Set variable  Mahendra
    ${middle_name} =  Set variable  Pratap
    ${family_name} =  Set variable  Baahubali
    ${dob} =  Set variable  2015-03-31
    ${place_of_birth} =  Set variable  Uthara
    ${nationality} =  Set variable  India
    ${payload} =  BuiltIn.Create Dictionary   first_name=${first_name}  middle_name=${middle_name}  family_name=${family_name}  dob=${dob}  place_of_birth=${place_of_birth}  nationality=${nationality}
    ${header} =  BuiltIn.Create Dictionary  Content-Type=application/json
    ${ret_response} =  PeopleRegistrationApp_REST.Register new people  ${payload}  ${header}
    ${ret_response} =  Set variable  ${ret_response.json()}
    Log To Console  ${ret_response}[id]
    home_page.Verify "People Management page" is loaded
    Sleep  1s
    home_page.Click on "List of People"
    Sleep  1s
    peoplelist_page.Verify "People list" page is loaded
    Sleep  1s
    ${people_info_list} =  peoplelist_page.Get Registered People list
    ${last_added_info} =  Set Variable  ${people_info_list}[-1]
    Log to Console  ${last_added_info}
    Should Be Equal  ${last_added_info}[0]  ${first_name}
    Should Be Equal  ${last_added_info}[1]  ${middle_name}
    Should Be Equal  ${last_added_info}[2]  ${family_name}
    ${date1} =  Convert Date  ${dob}  date_format=%Y-%m-%d
    ${date2} =  Convert Date  ${last_added_info}[3]
    Should Be Equal  ${date1}  ${date2}
    Should Be Equal  ${last_added_info}[4]  ${place_of_birth}
    Should Be Equal  ${last_added_info}[5]  ${nationality}
    PeopleRegistrationApp_REST.Delete registered people by id  ${ret_response}[id]

*** Keywords ***


