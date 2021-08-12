*** Settings ***
Documentation  This suite includes tests related to REST API
Resource  ../Resources/PeopleRegistration_REST/PeopleRegistrationApp_REST.robot


*** Variables ***


*** Test Cases ***
Perform GET request and get all users
    [Documentation]  The test case is to get all registered users
    [Tags]  REST_Get
    PeopleRegistrationApp_REST.Get all registered people

Get registered people by id
    [Documentation]  The test case is to get all registered users
    [Tags]  REST_Get_by_id
    PeopleRegistrationApp_REST.Get registered people by id  44

Register new people
    [Documentation]  The test case is to register new people
    [Tags]  REST_Post
    ${payload} =  BuiltIn.Create Dictionary   first_name=Sentinel  middle_name=aeolus  family_name=copernicus  dob=2015-03-31  place_of_birth=SA  nationality=SA
    ${header} =  BuiltIn.Create Dictionary  Content-Type=application/json
    PeopleRegistrationApp_REST.Register new people  ${payload}  ${header}

Update new people
    [Documentation]  The test case is to update registered new people
    [Tags]  REST_Put
    ${payload} =  BuiltIn.Create Dictionary   first_name=Sentinels  middle_name=aeolus  family_name=copernicus  dob=2015-03-31  place_of_birth=SA  nationality=SAfrica
    ${header} =  BuiltIn.Create Dictionary  Content-Type=application/json
    PeopleRegistrationApp_REST.Update registered new people by id  74  ${payload}  ${header}

Delete registered people by id
    [Documentation]  The test case is to get all registered users
    [Tags]  REST_Delete
    PeopleRegistrationApp_REST.Delete registered people by id  74

*** Keywords ***


