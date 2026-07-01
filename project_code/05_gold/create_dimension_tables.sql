-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : create_dimension_tables.sql
-- Author  : Dinesh Prajapat
-- Layer   : Gold
-- Purpose : Create Dimension Tables for Star Schema
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA marts;

-- ============================================================
-- Store Dimension
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.dim_store (

    store_key          NUMBER AUTOINCREMENT START 1 INCREMENT 1,

    store_id           STRING        NOT NULL,

    store_name         STRING,

    store_city         STRING,

    store_region       STRING,

    CONSTRAINT pk_dim_store PRIMARY KEY (store_key)

);

-- ============================================================
-- Product Dimension
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.dim_product (

    product_key        NUMBER AUTOINCREMENT START 1 INCREMENT 1,

    product_sku        STRING        NOT NULL,

    product_name       STRING,

    category           STRING,

    subcategory        STRING,

    CONSTRAINT pk_dim_product PRIMARY KEY (product_key)

);

-- ============================================================
-- Supplier Dimension
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.dim_supplier (

    supplier_key       NUMBER AUTOINCREMENT START 1 INCREMENT 1,

    supplier_id        STRING       NOT NULL,

    supplier_name      STRING,

    supplier_city      STRING,

    CONSTRAINT pk_dim_supplier PRIMARY KEY (supplier_key)

);

-- ============================================================
-- Date Dimension
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.dim_date (

    date_key           NUMBER,

    transaction_date   DATE        NOT NULL,

    day_number         NUMBER,

    month_number       NUMBER,

    month_name         STRING,

    quarter_number     NUMBER,

    year_number        NUMBER,

    day_name           STRING,

    CONSTRAINT pk_dim_date PRIMARY KEY (date_key)

);
