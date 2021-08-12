*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***
${LIST_PAGE_HEADER_XPATH} =  xpath:/html/body/div[2]/div[1]/h1
${HOME_BUTTON} =  xpath:/html/body/div[2]/div[2]/p[1]/a[1]
${ADD_NEW_PERSON_BUTTON} =  xpath:/html/body/div[2]/div[2]/p[1]/a[2]
${PEOPLE_INFO_TABLE} =  id=peoplelist
${PEOPLE_INFO_TABLE_TBODY} =  xpath://*[@id="peoplelist"]/tbody
${PEOPLE_INFO_TABLE_TBODY_ROW} =  xpath://*[@id="peoplelist"]/tbody/tr
${PEOPLE_INFO_TABLE_HEADER} =  xpath://*[@id="peoplelist"]/thead
${SEARCH_BOX} =  id=myInput


*** Keywords ***
Verify "People list" page is loaded
    [Documentation]  Verifies if "People List" page is loaded
    Wait Until Page Contains Element  ${LIST_PAGE_HEADER_XPATH}  2s  Home page is not loaded

Click on "Home" Button
    [Documentation]  Click on "Home" Button
    Click Link  ${HOME_BUTTON}

Click on "Add New Person Info" Button
    [Documentation]  Click on "Register New User" Button
    Click Link  ${ADD_NEW_PERSON_BUTTON}

Enter text value to search
    [Arguments]  ${SearchText}
    [Documentation]  Seach by keyword in "First Name" and "Surname" column
    Input Text  ${SEARCH_BOX}

Get Registered People list
    [Documentation]  Reads the table and returns the value
    ${no_of_rows} =  Get Registered People Table Row Count
    ${int_no_rows} =  Convert To Integer  ${no_of_rows}
    @{people_info_list} =  Create List
    FOR  ${row_count}  IN RANGE  1  ${int_no_rows}+1
      @{nested_people_list} =  Create List
      ${no_of_columns} =  Get Registered People Table Column Count  ${row_count}
      FOR  ${col_count}  IN RANGE  1  ${no_of_columns}+1
        ${dynamic_xpath} =     Catenate    SEPARATOR=  ${PEOPLE_INFO_TABLE_TBODY_ROW}   [${row_count}]/td[${col_count}]
        ${cell_val} =  get text  ${dynamic_xpath}
        Append To List  ${nested_people_list}  ${cell_val}
      END
      Append To List  ${people_info_list}  ${nested_people_list}
    END
    Log to console  ${people_info_list}
    [Return]  ${people_info_list}


Get Registered People Table Row Count
    [Documentation]  Retrieves and returns the no. of row in the table body
    ${no_of_rows} =  Get Element Count  ${PEOPLE_INFO_TABLE_TBODY_ROW}
    [Return]  ${no_of_rows}

Get Registered People Table Column Count
    [Arguments]  ${row_number}
    [Documentation]  Retrieves and returns the no. of row in the table
    ${row_number} =  Convert To String  ${row_number}
    ${dynamic_xpath} =     Catenate    SEPARATOR=  ${PEOPLE_INFO_TABLE_TBODY_ROW}   [${row_number}]/td
    ${column_count} =  Get Element Count  ${dynamic_xpath}
    [Return]  ${column_count}
