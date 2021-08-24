*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL} =  http://www.localhost:8081
${BROSWER} =  headlessfirefox

*** Keywords ***
Begin web test
    [Documentation]  This function will launch the browser
    open browser  ${URL}  ${BROSWER}
    Maximize Browser Window

End web test
    [Documentation]  This function is to close the broswer
    close browser

