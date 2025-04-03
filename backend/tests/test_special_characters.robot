*** Settings ***
Suite Setup    Start Session
Resource    ../resources/viacep_keywords.robot

*** Test Cases ***
Should Fail With Special Characters In CEP
    ${response}=    Get CEP Response    01-001@00
    Should Be Equal As Integers    ${response.status_code}    400