CREATE VIEW gold.Calendar
AS
SELECT *
FROM OPENROWSET(
    BULK 'https://awsdeltalakedr.dfs.core.windows.net/silver/AdventureWorks_Calendar/',
    FORMAT = 'PARQUET'
) AS Query1;
GO

CREATE VIEW gold.Customers
AS
SELECT *
FROM OPENROWSET(
    BULK 'https://awsdeltalakedr.dfs.core.windows.net/silver/AdventureWorks_Customers/',
    FORMAT = 'PARQUET'
) AS Query1;
GO

CREATE VIEW gold.Products
AS
SELECT *
FROM OPENROWSET(
    BULK 'https://awsdeltalakedr.dfs.core.windows.net/silver/AdventureWorks_Products/',
    FORMAT = 'PARQUET'
) AS Query1;
GO

CREATE VIEW gold.Returns
AS
SELECT *
FROM OPENROWSET(
    BULK 'https://awsdeltalakedr.dfs.core.windows.net/silver/AdventureWorks_Returns/',
    FORMAT = 'PARQUET'
) AS Query1;
GO

CREATE VIEW gold.Sales
AS
SELECT *
FROM OPENROWSET(
    BULK 'https://awsdeltalakedr.dfs.core.windows.net/silver/AdventureWorks_Sales/',
    FORMAT = 'PARQUET'
) AS Query1;
GO

CREATE VIEW gold.Territories
AS
SELECT *
FROM OPENROWSET(
    BULK 'https://awsdeltalakedr.dfs.core.windows.net/silver/AdventureWorks_Territories/',
    FORMAT = 'PARQUET'
) AS Query1;
GO


CREATE VIEW gold.Product_Subcategories
AS
SELECT *
FROM OPENROWSET(
    BULK 'https://awsdeltalakedr.dfs.core.windows.net/silver/Product_Subcategories/',
    FORMAT = 'PARQUET'
) AS Query1;
GO

CREATE VIEW gold.Product_Categories
AS
SELECT *
FROM OPENROWSET(
    BULK 'https://awsdeltalakedr.dfs.core.windows.net/silver/AdventureWorks_Product_Categories/',
    FORMAT = 'PARQUET'
) AS Query1;
GO

SELECT *
FROM sys.external_data_sources;

SELECT OBJECT_DEFINITION(OBJECT_ID('gold.Calendar'));