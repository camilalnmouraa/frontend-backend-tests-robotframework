# API Tests com Robot Framework

[![CI Status](https://github.com/camilalnmouraa/frontend-backend-tests-robotframework/actions/workflows/backend-tests.yml/badge.svg)](https://github.com/camilalnmouraa/frontend-backend-tests-robotframework/actions)

Projeto de **testes automatizados** utilizando **Robot Framework**, com execução via **GitHub Actions**, e geração de relatórios analíticos.

---

## Como Executar os Testes Localmente

1. Instale o Python 3.10 e os pacotes necessários:

```bash
pip install -r requirements.txt
```
2. Execute os testes com o script:

```bash
run_backend_tests.bat
```
3. Após a execução, os relatórios estarão disponíveis na pasta `results/`.

## Saídas Analíticas

A cada execução dos testes, são gerados automaticamente os seguintes arquivos:

- `log.html`: Detalhamento completo dos passos dos testes (útil para depuração de falhas);
- `report.html`: Sumário com número de testes, falhas, tempo total e sucesso;
- `output.xml`: Saída em XML usada por ferramentas de integração contínua.

>Você pode visualizar os relatórios localmente abrindo o arquivo `log.html` no navegador.

>Você pode baixar e visualizar os relatórios diretamente pela aba **Actions** do GitHub.


## Estrutura do Projeto

```
backend/
├── config/                     # Variáveis do ambiente backend
│   └── variables_back.robot
├── resources/                  # Palavras-chave específicas da API
│   └── viacep_keywords.robot
├── tests/                      # Casos de teste da API ViaCEP
│   ├── test_invalid_cep.robot
│   ├── test_invalid_format.robot
│   ├── test_special_characters.robot
│   └── test_valid_cep.robot
├── results/                    # Relatórios gerados após execução
│   ├── log.html
│   ├── output.xml
│   └── report.html
├── requirements.txt            # Dependências do projeto
└── run_backend_tests.bat       # Script de execução local
```

## Pipeline Automatizado

Este projeto utiliza GitHub Actions para executar os testes automaticamente a cada push ou pull request no diretório `backend/`.

Você pode acompanhar o status atual dos testes pela badge no topo deste README ou acessar diretamente:
[https://github.com/camilalnmouraa/frontend-backend-tests-robotframework/actions](https://github.com/camilalnmouraa/frontend-backend-tests-robotframework/actions)

___

This project was created with 🎶 and ☕ by [Camila](https://www.linkedin.com/in/camilalnmoura/)

