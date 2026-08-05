# **Convenções de Nomenclatura**

Este documento descreve as convenções de nomenclatura utilizadas para schemas, tabelas, views, colunas e outros objetos no data warehouse.

## **Sumário**

1. [Princípios Gerais](#general-principles)
2. [Convenções de Nomenclatura de Tabelas](#table-naming-conventions)
   - [Regras Bronze](#bronze-rules)
   - [Regras Prata](#silver-rules)
   - [Regras Ouro](#gold-rules)
3. [Convenções de Nomenclatura de Colunas](#column-naming-conventions)
   - [Chaves Substitutas (Surrogate Keys)](#surrogate-keys)
   - [Colunas Técnicas](#technical-columns)
4. [Stored Procedure](#stored-procedure-naming-conventions)

---

## **Princípios Gerais**

- **Convenções de Nomenclatura**: snake*case, com letras minúsculas e underline (`*`) para separar palavras.
- **Idioma**: inglês para todos os nomes.

## **Convenções de Nomenclatura de Tabelas**

### **Regras Bronze**

- Todos os nomes devem começar com o nome do sistema de origem, e os nomes das tabelas devem corresponder aos seus nomes originais, sem renomeação.
- **`<sourcesystem>_<entity>`**
  - `<sourcesystem>`: Nome do sistema de origem (ex.: `crm`, `erp`).
  - `<entity>`: Nome exato da tabela no sistema de origem.
  - Exemplo: `crm_customer_info` → Informações de clientes do sistema CRM.

### **Regras Prata**

- Todos os nomes devem começar com o nome do sistema de origem, e os nomes das tabelas devem corresponder aos seus nomes originais, sem renomeação.
- **`<sourcesystem>_<entity>`**
  - `<sourcesystem>`: Nome do sistema de origem (ex.: `crm`, `erp`).
  - `<entity>`: Nome exato da tabela no sistema de origem.
  - Exemplo: `crm_customer_info` → Informações de clientes do sistema CRM.

### **Regras Ouro**

- Todos os nomes devem usar nomes significativos e alinhados ao negócio para as tabelas, começando com o prefixo de categoria.
- **`<category>_<entity>`**
  - `<category>`: Descreve o papel da tabela, como `dim` (dimensão) ou `fact` (tabela fato).
  - `<entity>`: Nome descritivo da tabela, alinhado ao domínio de negócio (ex.: `customers`, `products`, `sales`).
  - Exemplos:
    - `dim_customers` → Tabela de dimensão para dados de clientes.
    - `fact_sales` → Tabela fato contendo as transações de vendas.

#### **Glossário de Padrões de Categoria**

| Padrão    | Significado         | Exemplo(s)                                 |
| --------- | ------------------- | ------------------------------------------ |
| `dim_`    | Tabela de dimensão  | `dim_customer`, `dim_product`              |
| `fact_`   | Tabela fato         | `fact_sales`                               |
| `report_` | Tabela de relatório | `report_customers`, `report_sales_monthly` |

## **Convenções de Nomenclatura de Colunas**

### **Chaves Substitutas (Surrogate Keys)**

- Todas as chaves primárias nas tabelas de dimensão devem usar o sufixo `_key`.
- **`<table_name>_key`**
  - `<table_name>`: Refere-se ao nome da tabela ou entidade à qual a chave pertence.
  - `_key`: Sufixo que indica que essa coluna é uma chave substituta (surrogate key).
  - Exemplo: `customer_key` → Chave substituta na tabela `dim_customers`.

### **Colunas Técnicas**

- Todas as colunas técnicas devem começar com o prefixo `dwh_`, seguido de um nome descritivo indicando a finalidade da coluna.
- **`dwh_<column_name>`**
  - `dwh`: Prefixo exclusivo para metadados gerados pelo sistema.
  - `<column_name>`: Nome descritivo indicando a finalidade da coluna.
  - Exemplo: `dwh_load_date` → Coluna gerada pelo sistema, usada para armazenar a data em que o registro foi carregado.

## **Stored Procedure**

- Todas as stored procedures usadas para carregar dados devem seguir o padrão de nomenclatura:
- **`load_<layer>`**.
  - `<layer>`: Representa a camada que está sendo carregada, como `bronze`, `silver` ou `gold`.
  - Exemplo:
    - `load_bronze` → Stored procedure para carregar dados na camada Bronze.
    - `load_silver` → Stored procedure para carregar dados na camada Silver.
