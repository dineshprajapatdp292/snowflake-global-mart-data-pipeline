-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : create_dimension_tables.sql
-- Author  : Dinesh Prajapat
-- Layer   : Gold
-- Purpose : Create dimension tables
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA marts;

----------------------------------------------------------
-- Store Dimension
----------------------------------------------------------

CREATE OR REPLACE TABLE global_mart_db.marts.dim_store (

    store_id        STRING PRIMARY KEY,
    store_name      STRING,
    store_city      STRING,
    store_region    STRING

);

----------------------------------------------------------
-- Product Dimension
----------------------------------------------------------

CREATE OR REPLACE TABLE global_mart_db.marts.dim_product (

    product_sku     STRING PRIMARY KEY,
    product_name    STRING,
    category        STRING,
    subcategory     STRING

);

----------------------------------------------------------
-- Supplier Dimension
----------------------------------------------------------

CREATE OR REPLACE TABLE global_mart_db.marts.dim_supplier (

    supplier_id     STRING PRIMARY KEY,
    supplier_name   STRING,
    supplier_city   STRING

);

----------------------------------------------------------
-- Date Dimension
----------------------------------------------------------

CREATE OR REPLACE TABLE global_mart_db.marts.dim_date (

    transaction_date DATE PRIMARY KEY,
    day_number       NUMBER,
    month_number     NUMBER,
    month_name       STRING,
    quarter_number   NUMBER,
    year_number      NUMBER,
    day_name         STRING

);
