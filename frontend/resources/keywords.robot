*** Settings ***
Library    SeleniumLibrary
Resource   locators.robot
Resource   ../config/variables.robot

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.3s
    Wait Until Page Contains Element    ${SEARCH_INPUT}

Fechar Navegador
    Close Browser

Acessar Site Kabum
    Go To    ${URL}
    Wait Until Page Contains Element    ${SEARCH_INPUT}

Buscar Produto
    [Arguments]    ${produto}
    Input Text    ${SEARCH_INPUT}    ${produto}
    Press Keys    ${SEARCH_INPUT}    RETURN
    Wait Until Page Contains Element    ${FIRST_PRODUCT}

Selecionar Primeiro Produto
    Click Element    ${FIRST_PRODUCT}
    Wait Until Page Contains Element    ${FRETE_INPUT}

Inserir CEP E Validar Frete
    [Arguments]    ${cep}
    Input Text    ${FRETE_INPUT}    ${cep}
    Click Element    ${CALCULAR_FRETE_BUTTON}
    Wait Until Page Contains Element    ${FRETE_RESULT}

Fechar Modal de Frete
    Click Button    Fechar
    Wait Until Element Does Not Contain    ${FRETE_RESULT}    Frete

Clicar em Comprar
    Click Button    Comprar
    Wait Until Page Contains Element    ${GARANTIA_CHECKBOX}

Selecionar Garantia Estendida
    Click Element    ${GARANTIA_CHECKBOX}
    Sleep    1s   # pequena pausa para garantir que o checkbox foi marcado

Ir Para o Carrinho
    Click Element    ${IR_PARA_CARRINHO_BUTTON}
    Wait Until Page Contains Element    ${PRODUTO_NO_CARRINHO}

Validar Produto No Carrinho
    Element Should Be Visible    ${PRODUTO_NO_CARRINHO}
    Element Should Contain    ${GARANTIA_NO_CARRINHO}    12 Meses