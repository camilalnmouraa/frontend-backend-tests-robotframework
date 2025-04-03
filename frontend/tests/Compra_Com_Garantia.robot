*** Settings ***
Documentation     Executa um teste E2E simulando a compra de um notebook com garantia estendida e validação de frete no site Kabum.
Resource          ../resources/keywords.robot
Resource          ../resources/locators.robot
Resource          ../config/variables.robot
Suite Setup       Abrir Site Kabum
Suite Teardown    Fechar Navegador

*** Test Cases ***
TC01 - Fluxo de Compra com Garantia Estendida
    [Documentation]    Simula a jornada de compra completa no e-commerce Kabum, incluindo busca de produto, cálculo de frete e seleção de garantia estendida.
    [Tags]    e2e    compra    critica

    Buscar e Selecionar Produto    ${SEARCH_TERM}
    Inserir CEP e Validar Modal de Frete    ${CEP_VALIDO}
    Fechar Modal de Frete
    Adicionar Produto ao Carrinho
    Selecionar Garantia Estendida    ${GARANTIA_CHECKBOX}    ${GARANTIA_LABEL}
    Acessar Carrinho
    Validar Produto no Carrinho