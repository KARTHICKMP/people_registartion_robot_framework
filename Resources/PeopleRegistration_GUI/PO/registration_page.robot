*** Settings ***


*** Variables ***
${REGISTRATION_PAGE_HEADER_ID} =  id=Registration_Page_header
${FIRTS_NAME_ID} =  id=firstName
${MIDDLE_NAME_ID} =  id=middleName
${FAMILY_NAME_ID} =  id=familyName
${DOB_ID} =  id=dOB
${PLACE_OF_BIRTH_ID} =  id=placeOfBirth
${NATIONALITY_ID} =  id=nationality
${SUBMIT_BTN_ID} =  id=submit_btn

*** Keywords ***
Verify "New Registration" page is loaded
    [Documentation]  Verifies if "New Registration Page" page is loaded
    Wait Until Page Contains Element  ${REGISTRATION_PAGE_HEADER_ID}  2s  "New Registration Page" is not loaded

Enter "First Name"
    [Arguments]  ${firstname}
    [Documentation]  Enters "First Name" in the text box
    Input Text  ${FIRTS_NAME_ID}  ${firstname}

Enter "Middle Name"
    [Arguments]  ${lastname}
    [Documentation]  Enters "Middle Name" in the text box
    Input Text  ${MIDDLE_NAME_ID}  ${lastname}

Enter "Family Name"
    [Arguments]  ${familyname}
    [Documentation]  Enters "Family Name" in the text box
    Input Text  ${FAMILY_NAME_ID}  ${familyname}

Enter "Date of Birth"
    [Arguments]  ${dob}
    [Documentation]  Enters "Date of Birth" in the text box
    Press keys  ${DOB_ID}  ${dob}

Enter "Place of Birth"
    [Arguments]  ${birthplace}
    [Documentation]  Enters "Place of Birth" in the text box
    Input Text  ${PLACE_OF_BIRTH_ID}  ${birthplace}

Enter "Nationality"
    [Arguments]  ${nationality}
    [Documentation]  Enters "Nationality" in the text box
    Input Text  ${NATIONALITY_ID}  ${nationality}

Click "Submit" button
    [Documentation]  Clicks "Submit" button
    Click Button  ${SUBMIT_BTN_ID}