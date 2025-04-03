*** Settings ***
Suite Setup    Start Session
Resource    ../resources/viacep_keywords.robot

*** Test Cases ***
Should Fail With Less Than 8 Digits
    ${response}=    Get CEP Response    1234567
    Should Be Equal As Integers    ${response.status_code}    400

Should Fail With More Than 8 Digits
    ${response}=    Get CEP Response    123456789
    Should Be Equal As Integers    ${response.status_code}    400