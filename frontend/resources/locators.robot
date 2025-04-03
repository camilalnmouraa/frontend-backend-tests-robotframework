*** Variables ***

# =====================
# Busca / Compra
# =====================
${SEARCH_INPUT}               id=input-busca
# Campo de busca no topo da página

${SUGESTAO_PRODUTO}           css=.DropdownSearchbar a.sc-dd558cc4-8:first-of-type
# Primeiro item da lista de sugestões após digitar no campo de busca

${BOTAO_COMPRAR}              xpath=//button[normalize-space(.)="COMPRAR"]
# Botão de compra na página do produto

${COOKIES}                    id=onetrust-accept-btn-handler
# Botão para aceitar os cookies ao acessar o site

# =====================
# Frete / CEP
# =====================
${FRETE_INPUT}                id=inputCalcularFrete
# Campo para digitar o CEP no modal de frete

${CALCULAR_FRETE_BUTTON}      id=botaoCalcularFrete
# Botão para calcular frete

${MODAL_FRETE}                id=listaOpcoesFrete
# Modal que exibe as opções de frete após o cálculo

${FRETE_ECONOMICA}            xpath=//span[text()[contains(., "Entrega Econômica")]]
# Texto da opção de frete econômica

${FRETE_EXPRESSA}             xpath=//span[text()[contains(., "Entrega Expressa")]]
# Texto da opção de frete expressa

${BOTAO_FECHAR_MODAL}         css=div[role="dialog"] button[aria-label="Fechar"]
# Botão para fechar o modal de frete

# ============================
# Garantia / Produto
# ============================
${GARANTIA_CHECKBOX}          xpath=//input[@type="radio" and @name="garantia" and @value="4342883"]
# Checkbox para seleção de garantia estendida (12 meses)

# =====================
# Carrinho
# =====================
${IR_PARA_CARRINHO_BUTTON}    css=a#linkCarrinhoHeader
# Botão/link para acessar o carrinho de compras no topo do site

${PRODUTO_NO_CARRINHO}        css=a.productName
# Nome do produto adicionado ao carrinho (usado para validação)

${GARANTIA_NO_CARRINHO}       xpath=//span[contains(text(), "12 Meses")]
# Validação da garantia selecionada no carrinho