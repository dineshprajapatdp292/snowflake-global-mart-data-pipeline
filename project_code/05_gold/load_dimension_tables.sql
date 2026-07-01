-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : load_dimension_tables.sql
-- Author  : Dinesh Prajapat
-- Layer   : Gold
-- Purpose : Load Dimension Tables using MERGE
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA marts;

-- ============================================================
-- Load Store Dimension
-- ============================================================

MERGE INTO global_mart_db.marts.dim_store tgt

USING (

    SELECT DISTINCT

        store_id,
        store_name,
        store_city,
        store_region

    FROM global_mart_db.staging.stg_csv_transaction

) src

ON tgt.store_id = src.store_id

WHEN MATCHED THEN
UPDATE SET

    tgt.store_name = src.store_name,
    tgt.store_city = src.store_city,
    tgt.store_region = src.store_region

WHEN NOT MATCHED THEN

INSERT (

    store_id,
    store_name,
    store_city,
    store_region

)

VALUES (

    src.store_id,
    src.store_name,
    src.store_city,
    src.store_region

);

---------------------------------------------------------------
-- Load Product Dimension
---------------------------------------------------------------

MERGE INTO global_mart_db.marts.dim_product tgt

USING (

    SELECT DISTINCT

        product_sku,
        product_name,
        category,
        subcategory

    FROM global_mart_db.staging.stg_csv_transaction

) src

ON tgt.product_sku = src.product_sku

WHEN MATCHED THEN
UPDATE SET

    tgt.product_name = src.product_name,
    tgt.category = src.category,
    tgt.subcategory = src.subcategory

WHEN NOT MATCHED THEN

INSERT (

    product_sku,
    product_name,
    category,
    subcategory

)

VALUES (

    src.product_sku,
    src.product_name,
    src.category,
    src.subcategory

);

---------------------------------------------------------------
-- Load Supplier Dimension
---------------------------------------------------------------

MERGE INTO global_mart_db.marts.dim_supplier tgt

USING (

    SELECT DISTINCT

        supplier_id,
        supplier_name,
        supplier_city

    FROM global_mart_db.staging.stg_parquet_erp

) src

ON tgt.supplier_id = src.supplier_id

WHEN MATCHED THEN
UPDATE SET

    tgt.supplier_name = src.supplier_name,
    tgt.supplier_city = src.supplier_city

WHEN NOT MATCHED THEN

INSERT (

    supplier_id,
    supplier_name,
    supplier_city

)

VALUES (

    src.supplier_id,
    src.supplier_name,
    src.supplier_city

);

---------------------------------------------------------------
-- Load Date Dimension
---------------------------------------------------------------

MERGE INTO global_mart_db.marts.dim_date tgt

USING (

    SELECT DISTINCT

        transaction_date,

        YEAR(transaction_date) * 10000 +
        MONTH(transaction_date) * 100 +
        DAY(transaction_date) AS date_key,

        DAY(transaction_date) AS day_number,

        MONTH(transaction_date) AS month_number,

        MONTHNAME(transaction_date) AS month_name,

        QUARTER(transaction_date) AS quarter_number,

        YEAR(transaction_date) AS year_number,

        DAYNAME(transaction_date) AS day_name

    FROM global_mart_db.staging.stg_csv_transaction

) src

ON tgt.date_key = src.date_key

WHEN MATCHED THEN
UPDATE SET

    tgt.transaction_date = src.transaction_date,
    tgt.day_number = src.day_number,
    tgt.month_number = src.month_number,
    tgt.month_name = src.month_name,
    tgt.quarter_number = src.quarter_number,
    tgt.year_number = src.year_number,
    tgt.day_name = src.day_name

WHEN NOT MATCHED THEN

INSERT (

    date_key,
    transaction_date,
    day_number,
    month_number,
    month_name,
    quarter_number,
    year_number,
    day_name

)

VALUES (

    src.date_key,
    src.transaction_date,
    src.day_number,
    src.month_number,
    src.month_name,
    src.quarter_number,
    src.year_number,
    src.day_name

);
