# 🚀 DevOps Journey: Full Automation Pipeline
**by Alison Melo**

Este projeto é uma demonstração prática de um ciclo **CI/CD End-to-End**, focado em automação total, provisionamento como código e resiliência em nuvem.

<p align="left">
  <img src="https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform" />&nbsp;
  <img src="https://img.shields.io/badge/ansible-%23EE0000.svg?style=for-the-badge&logo=ansible&logoColor=white" alt="Ansible" />&nbsp;
  <img src="https://img.shields.io/badge/docker-%232496ed.svg?style=for-the-badge&logo=docker&logoColor=white" alt="Docker" />&nbsp;
  <img src="https://img.shields.io/badge/github%20actions-%232088FF.svg?style=for-the-badge&logo=githubactions&logoColor=white" alt="GitHub Actions" />&nbsp;
  <img src="https://img.shields.io/badge/ubuntu-%23E95420.svg?style=for-the-badge&logo=ubuntu&logoColor=white" alt="Ubuntu" />&nbsp;
  <img src="https://img.shields.io/badge/oracle-%23F80000.svg?style=for-the-badge&logo=oracle&logoColor=white" alt="Oracle Cloud" />
</p>

---

## 📊 Arquitetura do Sistema

```mermaid
graph LR
    A[💻 Local Code] -- "git push" --> B(GitHub Actions)
    subgraph "☁️ Oracle Cloud Infrastructure"
    B -- "Orquestração" --> C{Automated Workflow}
    C -- "Provisiona" --> D[Terraform: Infra]
    C -- "Configura" --> E[Ansible: S.O]
    C -- "Build & Run" --> F[Docker: App]
    end
    G[👤 Usuário Final] -- "HTTP Access" --> F
```

---

## 🧰 Stack Tecnológico

* **Cloud Provider:** Oracle Cloud Infrastructure (OCI)
* **Infraestrutura como Código (IaC):** Terraform
* **Gerência de Configuração:** Ansible
* **Containerização:** Docker (Nginx/Alpine)
* **Automação de CI/CD:** GitHub Actions
* **Sistema Operacional:** Ubuntu Server

---

## 🛠️ Detalhes da Implementação

| Tecnologia | Função | Descrição |
| :--- | :--- | :--- |
| **Terraform** | IaC | Provisionamento de rede (VCN), Firewall e Instância AMD em Ashburn. |
| **Ansible** | Config Management | Hardening do S.O, liberação de IPtables e orquestração do Docker. |
| **Docker** | Containerization | Empacotamento da aplicação em imagem isolada e imutável. |
| **GitHub Actions** | CI/CD | Pipeline automatizado que dispara o deploy a cada alteração no código. |

---

## 🔗 Acesse o Projeto
O site está no ar e é atualizado automaticamente a cada alteração neste repositório:
👉 **[http://157.151.233.30](http://157.151.233.30)**

---
<p align="center">
  <i>"A automação é a única forma de garantir que o sucesso seja previsível."</i>
</p>