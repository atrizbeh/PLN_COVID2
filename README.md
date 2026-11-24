# Plataforma Educacional de Mineração de Texto e PLN

Este repositório contém a implementação completa da **Plataforma Educacional de Mineração de Texto e Linguagem Natural** descrita no prompt fornecido.

## Visão geral
- **Frontend**: Next.js (App Router) + React + TypeScript + Tailwind CSS.
- **Backend**: Spring Boot (Java) com Spring Security, JPA e Flyway.
- **Serviço de PLN**: FastAPI (Python) usando spaCy, scikit‑learn e pandas.
- **Banco de dados**: PostgreSQL.
- **Infraestrutura**: Docker‑Compose + Nginx (proxy, TLS, CORS).

A estrutura de diretórios segue a convenção:
```
plataforma-pln/
├── backend/          # API REST com Spring Boot
├── frontend/         # UI com Next.js
├── nlp-service/      # FastAPI para algoritmos de PLN
├── datasets/         # Corpora e scripts de ingestão
├── infra/            # Docker compose, Nginx
├── docs/             # Documentação da API, arquitetura, guia do usuário
└── README.md
```

Para iniciar o projeto localmente:
```bash
docker compose up --build
```

Consulte o `docs/architecture.md` para detalhes de design, modelo de dados e fluxo de trabalho.
