*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL} =  http://localhost:8081/


*** Keywords ***
Get all registered people
    [Documentation]  GET request to retreive all registered users
    Create Session  people_reg_session  ${URL}
    ${response} =  GET On Session  people_reg_session  get_all_registered_people
    Check for Resposnse code  ${response}  200
    Delete All Sessions
    [Return]  ${response}


Get registered people by id
    [Arguments]  ${id}
    [Documentation]  Get request to retreive registered user by id
    Create Session  people_reg_session  ${URL}
    ${abs_url} =  Catenate    SEPARATOR=  get_people_info/   ${id}
    log to console  ${abs_url}
    ${response} =  GET On Session  people_reg_session  ${abs_url}
    Check for Resposnse code  ${response}  200
    Delete All Sessions
    [Return]  ${response}

Register new people
    [Arguments]  ${payload}  ${header}
    [Documentation]  POST request to register new people
    Create Session  people_reg_session  ${URL}
    ${response} =  POST On Session  people_reg_session  /new_registration  json=${payload}  headers=${header}
    Check for Resposnse code  ${response}  201
    Delete All Sessions
    [Return]  ${response}

Update registered new people by id
    [Arguments]  ${id}  ${payload}  ${header}
    [Documentation]  PUT request to register new people
    Create Session  people_reg_session  ${URL}
    ${abs_url} =  Catenate    SEPARATOR=  update_peopleinfo/   ${id}
    ${response} =  PUT On Session  people_reg_session  ${abs_url}  json=${payload}  headers=${header}
    Check for Resposnse code  ${response}  200
    Delete All Sessions
    [Return]  ${response}

Delete registered people by id
    [Arguments]  ${id}
    [Documentation]  Delete request to delete registered user by id
    Create Session  people_reg_session  ${URL}
    ${abs_url} =  Catenate    SEPARATOR=  delete_people_info/   ${id}
    log to console  ${abs_url}
    ${response} =  DELETE On Session  people_reg_session  ${abs_url}
    Check for Resposnse code  ${response}  200
    Delete All Sessions
    [Return]  ${response}

Check for Resposnse code
    [Arguments]  ${actual_reponse}  ${expected_response_code}
    # Check the Response status
    Should Be Equal As Strings  ${actual_reponse.status_code}  ${expected_response_code}

