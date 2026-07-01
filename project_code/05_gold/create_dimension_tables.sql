-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : create_dimension_tables.sql
-- Author  : Dinesh Prajapat
-- Layer   : Gold
-- Purpose : Create Dimension Tables using Surrogate Keys
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA marts;

-- ============================================================
-- Store Dimension
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.dim_store (

    store_key          NUMBER AUTOINCREMENT PRIMARY KEY,

    store_id           STRING NOT NULL,

    store_name         STRING,

    store_city         STRING,

    store_region       STRING

);

-- ============================================================
-- Product Dimension
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.dim_product (

    product_key        NUMBER AUTOINCREMENT PRIMARY KEY,

    product_sku        STRING NOT NULL,

    product_name       STRING,

    category           STRING,

    subcategory        STRING

);

-- ============================================================
-- Supplier Dimension
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.dim_supplier (

    supplier_key       NUMBER AUTOINCREMENT PRIMARY KEY,

    supplier_id        STRING NOT NULL,

    supplier_name      STRING,

    supplier_city      STRING

);

-- ============================================================
-- Date Dimension
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.dim_date (

    date_key           NUMBER PRIMARY KEY,

    transaction_date   DATE NOT NULL,

    day_number         NUMBER,

    month_number       NUMBER,

    month_name         STRING,

    quarter_number     NUMBER,

    year_number        NUMBER,

    day_name           STRING

);
