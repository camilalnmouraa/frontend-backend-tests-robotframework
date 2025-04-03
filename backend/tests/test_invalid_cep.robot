*** Settings ***
Suite Setup    Start Session
Resource    ../resources/viacep_keywords.robot

*** Test Cases ***
Should Return Error For Nonexistent CEP
    ${response}=    Get CEP Response    99999999
    Response Should Be Error    ${response}