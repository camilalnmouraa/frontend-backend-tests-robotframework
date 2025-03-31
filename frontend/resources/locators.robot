*** Variables ***
${SEARCH_INPUT}               xpath=//input[@placeholder="O que você está procurando?"]
${FIRST_PRODUCT}              xpath=(//div[contains(@class,"productCard")])[1]//a
${FRETE_INPUT}                xpath=//input[@name="zipcode"]
${CALCULAR_FRETE_BUTTON}      xpath=//button[contains(., "Calcular")]
${FRETE_RESULT}               xpath=//div[contains(@class,"sc-dnqmqq") and contains(., "frete")]
${GARANTIA_CHECKBOX}          xpath=//label[contains(., "+ 12 Meses")]/preceding-sibling::input
${IR_PARA_CARRINHO_BUTTON}    xpath=//a[contains(text(), "Ir para o carrinho")]
${PRODUTO_NO_CARRINHO}        xpath=//span[contains(@class, "productCardName")]
${GARANTIA_NO_CARRINHO}       xpath=//span[contains(text(), "12 Meses")]