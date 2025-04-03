*** Settings ***
Library    RequestsLibrary
Library     Collections
Resource    ../config/variables_back.robot

*** Keywords ***
Start Session
    [Documentation]    Inicia uma nova sessão HTTP com o serviço ViaCEP, desabilitando a verificação SSL.
    Create Session    viacep    ${BASE_URL}    verify=${False}

Get CEP Response
    [Documentation]    Realiza uma requisição GET para o serviço ViaCEP usando o CEP informado. Retorna a resposta da API.
    [Arguments]    ${cep}
    Log    URL usada: ${BASE_URL}/${cep}/json/
    ${response}=    GET On Session    viacep    /${cep}/json/    expected_status=ANY
    RETURN    ${response}

Response Should Be Successful
    [Documentation]    Verifica se a resposta tem status 200 e se contém a chave 'cep' no corpo da resposta.
    [Arguments]    ${response}
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    cep

Response Should Be Error
    [Documentation]    Valida que a resposta tem status 200, mas que o corpo da resposta contém a chave 'erro' com valor 'true'.
    [Arguments]    ${response}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    erro
    Should Be Equal    ${json['erro']}    true

Response Should Contain Valid Address
    [Documentation]    Verifica se a resposta é 200 e se os principais campos de endereço estão presentes no corpo da resposta.
    [Arguments]    ${response}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    cep
    Dictionary Should Contain Key    ${json}    logradouro
    Dictionary Should Contain Key    ${json}    bairro
    Dictionary Should Contain Key    ${json}    localidade
    Dictionary Should Contain Key    ${json}    uf