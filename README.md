# devops-portfolio-project# 🚀 Zero to Prod: Infraestrutura e Deploy Automatizado na Oracle Cloud (OCI)

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)

Este repositório contém um laboratório completo de DevOps que demonstra a implementação de uma esteira de CI/CD (Integração e Entrega Contínuas) de ponta a ponta. 

O objetivo do projeto é provisionar recursos de nuvem utilizando **Infraestrutura como Código (IaC)**, configurar o ambiente operacional de forma padronizada e realizar o deploy automatizado de uma aplicação web containerizada, tudo orquestrado sem intervenção humana.

---

## 🏗️ Arquitetura do Projeto

O fluxo de trabalho foi desenhado para simular um ambiente corporativo real de entrega de software:

1. **Código:** O desenvolvedor realiza o push do código da aplicação web e do `Dockerfile` para a branch `main`.
2. **Integração Contínua (CI):** O GitHub Actions intercepta o commit, constrói a imagem Docker da aplicação e a envia de forma segura para o GitHub Container Registry (GHCR).
3. **Provisionamento (IaC):** Na etapa de CD, o Terraform entra em ação conectando-se à Oracle Cloud Infrastructure (OCI) para provisionar uma Virtual Cloud Network (VCN), regras de firewall e uma instância de computação.
4. **Configuração (Configuration Management):** Com a máquina provisionada, o Ansible assume o controle via SSH, atualiza os pacotes do servidor, instala o Docker Engine de forma idempotente e faz o pull da imagem recém-criada.
5. **Execução:** O container é iniciado e a aplicação fica disponível para acesso público.

---

## 🧰 Stack Tecnológico

* **Cloud Provider:** Oracle Cloud Infrastructure (OCI)
* **Containerização:** Docker
* **Registry de Imagens:** GitHub Container Registry (ghcr.io)
* **Infraestrutura como Código (IaC):** Terraform
* **Gerência de Configuração:** Ansible
* **Automação de CI/CD:** GitHub Actions

---

## 📂 Estrutura do Repositório

```text
.
├── .github/workflows/
│   └── deploy.yml           # Pipeline de CI/CD do GitHub Actions
├── app/
│   ├── index.html           # Aplicação web estática
│   └── Dockerfile           # Receita da imagem Docker
├── terraform/
│   ├── main.tf              # Declaração dos recursos da OCI (Rede, Compute)
│   ├── variables.tf         # Variáveis do ambiente
│   └── provider.tf          # Configuração de autenticação da Oracle
└── ansible/
    ├── playbook.yml         # Tarefas de configuração do SO e Docker
    └── inventory.ini        # Dinamicamente populado pela pipeline