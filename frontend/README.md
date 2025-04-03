# E2E Tests com Robot Framework

[![CI Status](https://github.com/camilalnmouraa/frontend-backend-tests-robotframework/actions/workflows/frontend-tests.yml/badge.svg)](https://github.com/camilalnmouraa/frontend-backend-tests-robotframework/actions)

Projeto de **testes automatizados** utilizando **Robot Framework**, com execução via **GitHub Actions**, e geração de relatórios analíticos.

---

## Como Executar os Testes Localmente

1. Instale o Python 3.10 e os pacotes necessários:

```bash
pip install -r requirements.txt
```
2. Execute os testes com:

```bash
robot --output results/output.xml --log results/log.html --report results/report.html tests
```
3. Após a execução, os relatórios estarão disponíveis na pasta `results/`.

## Saídas Analíticas

A cada execução dos testes, são gerados automaticamente os seguintes arquivos:

- `log.html`: Detalhamento completo dos passos dos testes (útil para depuração de falhas);
- `report.html`: Sumário com número de testes, falhas, tempo total e sucesso;
- `output.xml`: Saída em XML usada por ferramentas de integração contínua.

Esses arquivos são salvos e disponibilizados como artefatos no job:
```bash
 Upload Robot Framework Report
```
Você pode baixar e visualizar os relatórios diretamente pela aba **Actions** do GitHub.

## Estrutura do Projeto

```
frontend/
├── config/                  # Variáveis de ambiente
│   └── variables.robot
├── resources/               # Arquivos reutilizáveis
│   ├── keywords.robot       # Palavras-chave customizadas
│   └── locators.robot       # Elementos da interface
├── results/                 # Relatórios gerados
│   ├── log.html
│   ├── output.xml
│   └── report.html
├── tests/                   # Casos de teste
│   └── Compra_Com_Garantia.robot
├── .gitignore               # Arquivos ignorados pelo Git
├── README.md                # Documentação do projeto
├── requirements.txt         # Dependências do projeto
├── run_frontend_tests.bat   # Script de execução local
└── frontend-tests.yml       # Pipeline de testes 
```

## Pipeline Automatizado

Este projeto utiliza **GitHub Actions** para execução automática dos testes a cada `push` ou `pull request`.

Você pode acompanhar o status atual dos testes pela badge no topo deste README ou acessar diretamente:
[https://github.com/camilalnmouraa/frontend-backend-tests-robotframework/actions](https://github.com/camilalnmouraa/frontend-backend-tests-robotframework/actions)

___

This project was created with 🎶 and ☕ by [Camila](https://www.linkedin.com/in/camilalnmoura/)

