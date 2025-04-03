*** Settings ***
Suite Setup    Start Session
Resource    ../resources/viacep_keywords.robot

*** Test Cases ***
Should Return Address For Valid CEP
    ${response}=    Get CEP Response    01001000
    Response Should Contain Valid Address    ${response}