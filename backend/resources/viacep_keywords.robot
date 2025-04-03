*** Settings ***
Library    RequestsLibrary
Library     Collections
Resource    ../config/variables_back.robot

*** Keywords ***
Start Session
    Create Session    viacep    ${BASE_URL}    verify=${False}

Get CEP Response
    [Arguments]    ${cep}
    Log    URL usada: ${BASE_URL}/${cep}/json/
    ${response}=    GET On Session    viacep    /${cep}/json/    expected_status=ANY
    RETURN    ${response}

Response Should Be Successful
    [Arguments]    ${response}
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    cep

Response Should Be Error
    [Arguments]    ${response}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    erro
    Should Be Equal    ${json['erro']}    true

Response Should Contain Valid Address
    [Arguments]    ${response}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    cep
    Dictionary Should Contain Key    ${json}    logradouro
    Dictionary Should Contain Key    ${json}    bairro
    Dictionary Should Contain Key    ${json}    localidade
    Dictionary Should Contain Key    ${json}    uf