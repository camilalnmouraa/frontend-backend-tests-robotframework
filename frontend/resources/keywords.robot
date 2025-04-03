*** Settings ***
Library    SeleniumLibrary
Resource   locators.robot
Resource   ../config/variables.robot

*** Keywords ***

Abrir Site Kabum
    [Documentation]    Abre o site da Kabum usando o navegador padrão (Chrome headless no CI).
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.3s
    Wait Until Page Contains Element    ${SEARCH_INPUT}
    Run Keyword And Ignore Error    Click Element    ${COOKIES}
    Log To Console    ✅ Site Kabum aberto com sucesso
    Log    Navegador aberto na URL ${URL}

Buscar e Selecionar Produto
    [Documentation]    Realiza a busca por um produto e clica na sugestão visível da pesquisa.
    [Arguments]    ${produto}
    Input Text    ${SEARCH_INPUT}    ${produto}
    Wait Until Element Is Visible    ${SUGESTAO_PRODUTO}
    Click Element    ${SUGESTAO_PRODUTO}
    Wait Until Page Contains Element    ${BOTAO_COMPRAR}
    Log To Console    🔎 Produto "${produto}" selecionado com sucesso
    Log    Busca concluída para: ${produto}

Inserir CEP E Validar Modal de Frete
    [Documentation]    Insere o CEP informado e valida se as opções de frete estão visíveis no modal.
    [Arguments]    ${cep}
    Input Text    ${FRETE_INPUT}    ${cep}
    Click Element    ${CALCULAR_FRETE_BUTTON}
    Wait Until Element Is Visible    ${MODAL_FRETE}
    Element Should Be Visible        ${FRETE_ECONOMICA}
    Element Should Be Visible        ${FRETE_EXPRESSA}
    Log To Console    📦 Modal de frete validado com sucesso para o CEP: ${cep}
    Log    Frete validado com sucesso para o CEP ${cep}

Fechar Modal de Frete
    [Documentation]    Fecha o modal de opções de frete.
    Wait Until Element Is Visible    ${BOTAO_FECHAR_MODAL}
    Wait Until Element Is Enabled    ${BOTAO_FECHAR_MODAL}
    Click Element                    ${BOTAO_FECHAR_MODAL}
    Log To Console    ✅ Modal de frete fechado com sucesso
    Log    Modal de frete fechado

Adicionar Produto ao Carrinho
    [Documentation]    Clica no botão "Comprar" e aguarda o carregamento da seção de garantia.
    Wait Until Element Is Visible    ${BOTAO_COMPRAR}
    Wait Until Element Is Enabled    ${BOTAO_COMPRAR}
    Click Element                    ${BOTAO_COMPRAR}
    Wait Until Page Contains Element    ${GARANTIA_CHECKBOX}
    Log To Console    🛒 Produto adicionado ao carrinho com sucesso
    Log    Produto adicionado ao carrinho após clique em "Comprar"

Selecionar Garantia Estendida
    [Documentation]    Seleciona a garantia estendida, caso ainda não esteja marcada.
    [Arguments]    ${elemento}    ${descricao}
    ${ja_selecionado}=    Get Element Attribute    ${elemento}    checked
    IF    '${ja_selecionado}' != 'true'
        Click Element    ${elemento}
        Log To Console    🔧 Garantia "${descricao}" foi selecionada
        Log    Garantia estendida "${descricao}" selecionada manualmente
    ELSE
        Log To Console    ℹ️ Garantia "${descricao}" já estava selecionada
        Log    Garantia já estava selecionada
    END

Acessar Carrinho
    [Documentation]    Clica para ir ao carrinho e aguarda o produto ser carregado.
    Wait Until Element Is Visible    ${IR_PARA_CARRINHO_BUTTON}
    Wait Until Element Is Enabled    ${IR_PARA_CARRINHO_BUTTON}
    Click Element    ${IR_PARA_CARRINHO_BUTTON}
    Wait Until Element Is Visible    ${PRODUTO_NO_CARRINHO}
    Log To Console    🧾 Carrinho acessado com sucesso
    Log    Carrinho acessado e produto carregado na tela

Validar Produto No Carrinho
    [Documentation]    Valida se o produto buscado e a garantia estão corretamente exibidos no carrinho.
    Element Should Contain       ${PRODUTO_NO_CARRINHO}    ${SEARCH_TERM}
    Element Should Contain    ${GARANTIA_NO_CARRINHO}    ${GARANTIA_LABEL}
    Log To Console    ✅ Produto e garantia validados no carrinho com sucesso
    Log    Validação final concluída com sucesso

Fechar Navegador
    [Documentation]    Fecha o navegador e captura screenshot se o teste falhar.
    Close Browser
    Log To Console    🚪 Navegador fechado
    Log    Navegador encerrado com sucesso