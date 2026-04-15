# 🚀 DevOps Journey: Full Automation Pipeline
**by Alison Melo**

Este projeto é uma demonstração prática de um ciclo **CI/CD End-to-End**, focado em automação total, provisionamento como código e resiliência em nuvem.

<p align="left">
  <img src="[https://cdn.jsdelivr.net/gh/devicons/devicon/icons/terraform/terraform-original.svg](https://cdn.jsdelivr.net/gh/devicons/devicon/icons/terraform/terraform-original.svg)" title="Terraform" alt="Terraform" width="40" height="40"/>&nbsp;
  <img src="[https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ansible/ansible-original.svg](https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ansible/ansible-original.svg)" title="Ansible" alt="Ansible" width="40" height="40"/>&nbsp;
  <img src="[https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg](https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg)" title="Docker" alt="Docker" width="40" height="40"/>&nbsp;
  <img src="[https://cdn.jsdelivr.net/gh/devicons/devicon/icons/githubactions/githubactions-original.svg](https://cdn.jsdelivr.net/gh/devicons/devicon/icons/githubactions/githubactions-original.svg)" title="GitHub Actions" alt="GitHub Actions" width="40" height="40"/>&nbsp;
  <img src="[https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain.svg](https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain.svg)" title="Ubuntu" alt="Ubuntu" width="40" height="40"/>&nbsp;
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