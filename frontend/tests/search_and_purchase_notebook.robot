*** Settings ***
Documentation     Teste de compra de notebook no Kabum com garantia e validação de frete
Resource          ../resources/keywords.robot
Resource          ../resources/locators.robot
Resource          ../config/variables.robot
Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Compra de Notebook com Garantia e Validação de Frete
    [Tags]    kabum    notebook    compra
    Acessar Site Kabum
    Buscar Produto    notebook
    Selecionar Primeiro Produto
    Inserir CEP E Validar Frete    ${CEP_VALIDO}
    Fechar Modal de Frete
    Clicar em Comprar
    Selecionar Garantia Estendida
    Ir Para o Carrinho
    Validar Produto No Carrinho