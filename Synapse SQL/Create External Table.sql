CREATE DATABASE SCOPED CREDENTIAL credential_name
WITH IDENTITY = 'Managed Identity'


CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://awsdeltalakedr.dfs.core.windows.net/silver',
    CREDENTIAL = credential_name
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://awsdeltalakedr.dfs.core.windows.net/gold',
    CREDENTIAL = credential_name
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

-- EXTERNAL TABLE -- 

CREATE EXTERNAL TABLE gold.extsales
WITH 
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT  * FROM gold.sales


SELECT * from gold.extsales;

CREATE EXTERNAL TABLE gold.extcustomer
WITH
(
    LOCATION = 'extcustomer',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.customers;

CREATE EXTERNAL TABLE gold.extproduct
WITH
(
    LOCATION = 'extproduct',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.products;

CREATE EXTERNAL TABLE gold.extterritory
WITH
(
    LOCATION = 'extterritory',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.Territories;

CREATE EXTERNAL TABLE gold.extcalendar
WITH
(
    LOCATION = 'extcalendar',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.calendar;


CREATE EXTERNAL TABLE gold.extreturns
WITH
(
    LOCATION = 'extreturns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.Returns;

SELECT * FROM gold.extreturns;


CREATE EXTERNAL TABLE gold.extproduct_subcategories
WITH
(
    LOCATION = 'extproduct_subcategories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.Product_Subcategories;

SELECT * FROM gold.extproduct_subcategories;


CREATE EXTERNAL TABLE gold.extproduct_categories
WITH
(
    LOCATION = 'extproduct_categories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.Product_Categories;

SELECT * FROM gold.extproduct_categories;

SELECT TOP 10 * FROM gold.extsales;

CREATE EXTERNAL TABLE gold.extterritory
WITH
(
    LOCATION = 'extterritory',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT *
FROM gold.Territories;

SELECT
    SCHEMA_NAME(schema_id) AS SchemaName,
    name AS ExternalTableName
FROM sys.external_tables;


SELECT TOP 10 * FROM gold.Territories;
SELECT TOP 5 * FROM gold.Calendar;
SELECT TOP 5 * FROM gold.Customers;
SELECT TOP 5 * FROM gold.Products;
SELECT TOP 5 * FROM gold.Sales;

