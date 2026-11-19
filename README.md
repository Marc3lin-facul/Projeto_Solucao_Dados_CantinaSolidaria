# Projeto Solucao de Dados - Cantina Solidaria 
# Cantina Solidária — Projeto Integrador de Banco de Dados II

**Instituição:** Instituto Federal de Educação, Ciência e Tecnologia do Rio de Janeiro (IFRJ) — Campus Niterói  
**Curso:** Bacharelado em Engenharia da Computação  
**Disciplina:** Banco de Dados II (2026.2)  
**SGBD:** MySQL Community Server 8.0.46  

---

## 1. Sobre o Projeto

O **Cantina Solidária** (`db_vendas_campus`) é uma solução de banco de dados desenvolvida para estruturar, automatizar e proteger as operações de vendas e encomendas de alimentos e bebidas realizadas por estudantes e servidores nos campi do IFRJ.

A base de dados centraliza o gerenciamento de **usuários**, **perfis de vendedores** (com chave PIX e turnos habituais), **catálogo de produtos**, **ofertas programadas por data/turno**, **pedidos**, **itens de pedido**, **pagamentos**, **consolidação de vendas** e **regras/avisos administrativos**, atendendo a três perfis distintos: **Administradores**, **Vendedores** e **Compradores**.

---

## 2. Integrantes do Grupo

| Nome Completo | Nickname (GitHub) |
| :--- | :--- |
| Cauê Augusto da Silva Valença de Souza | [@CaueAugustoSilva](https://github.com/nickname2) |
| Gabriel de Oliveira Pires | [@GabrielPires90](https://github.com/nickname2) |
| Marcelo Silva de Oliveira | [@Marc3lin-facul](https://github.com/Marc3lin-facul) |

---

## 3. Estrutura do Repositório

```text
Projeto_Solucao_Dados_CantinaSolidaria/
├── 01_modelo_logico/
│   └── modelo.jpg                          # Diagrama do Modelo Lógico Relacional (9 tabelas, PKs, FKs e UKs)
├── 02_scripts_sql/
│   ├── APD1/
│   │   ├── criacao_banco.sql               # DDL: Criação do banco db_vendas_campus e das 9 tabelas
│   │   ├── inserts.sql                     # DML: Povoamento inicial com 20+ registros por tabela
│   │   └── consultas.sql                   # DQL: 5 consultas simples, 3 com JOIN/agregação e 3 subconsultas
│   ├── APD2/
│   │   ├── rotinas.sql                     # PL/SQL: 3 Functions, 3 Stored Procedures e 3 Triggers
│   │   └── testes_rotinas.sql              # Scripts de validação e testes das rotinas procedurais
│   └── APD3/
│       └── segurança.sql                   # DCL: Criação de Roles, Usuários, GRANT, REVOKE e testes de acesso
├── 03_documentacao/
│   └── Documentacao_Tecnica_BDII.md        # Documentação técnica completa e incremental do projeto
├── 04_evidencias/
│   └── *.png                               # Capturas de tela comprovando DDL, DML, DQL, PL/SQL e DCL
└── README.md                               # Apresentação geral e guia de execução do repositório
```

---

## 4. Como Reproduzir e Executar o Projeto

1. Clone este repositório:
   ```bash
   git clone https://github.com/Marc3lin-facul/Projeto_Solucao_Dados_CantinaSolidaria.git
   ```
2. Abra o **MySQL Workbench** conectado a uma instância **MySQL 8.0+**.
3. Execute os scripts SQL na seguinte ordem:
   1. `02_scripts_sql/APD1/criacao_banco.sql`
   2. `02_scripts_sql/APD1/inserts.sql`
   3. `02_scripts_sql/APD1/consultas.sql`
   4. `02_scripts_sql/APD2/rotinas.sql`
   5. `02_scripts_sql/APD2/testes_rotinas.sql` *(executar instrução por instrução para observar os alertas de validação)*
   6. `02_scripts_sql/APD3/segurança.sql`

> **Nota de Segurança:** Nenhuma credencial sensível de produção está exposta neste repositório. As senhas presentes no script de testes da APD3 referem-se exclusivamente a contas locais de demonstração acadêmica.
