/*
=============================================================
Criando banco de dados e schemas
=============================================================
Objetivo:
    Esse script cria um novo banco de dados chamado 'DataWarehouse' após verificar se ele já existe.
    Se o banco já existir, ele é excluido e recriado.. Além disso, o script configura três schemas
    no banco de dados: 'bronze', 'silver' e 'gold'.
	
ATENÇÃO:
    Ao rodar esse script ele irá excluir a base de dados 'DataWarehouse', caso ela exista.
    Todos os dados no banco de dados serão permanentemente deletados. 
    Tenha certeza de que fez o backup antes de rodar esse script
*/

USE master;
GO

-- Exclui e recria o banco de dados 'Data Warehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Cria os schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
