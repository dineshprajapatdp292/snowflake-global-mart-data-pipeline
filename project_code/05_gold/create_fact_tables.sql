-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : create_fact_tables.sql
-- Author  : Dinesh Prajapat
-- Layer   : Gold
-- Purpose : Create Business Fact Tables
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA marts;

-- ============================================================
-- 1. Daily Sales Fact Table
-- Source : stg_csv_transaction
-- Grain  : One row per transaction line item
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.fact_daily_sales (

    sales_key         NUMBER AUTOINCREMENT PRIMARY KEY,

    transaction_id    STRING,
    date_key          NUMBER,
    store_key         NUMBER,
    product_key       NUMBER,

    quantity          NUMBER,
    unit_price        FLOAT,
    discount_pct      FLOAT,
    revenue           FLOAT,
    loyalty_points    NUMBER,

    payment_method    STRING,
    transaction_ts    TIMESTAMP,
    source_file       STRING,
    processing_time   TIMESTAMP

);

-- ============================================================
-- 2. Gross Margin Fact Table
-- Source : stg_csv_transaction + stg_parquet_erp
-- Grain  : One row per sales transaction line joined with ERP cost
-- Purpose: Revenue vs cost vs gross profit analysis
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.fact_gross_margin (

    margin_key             NUMBER AUTOINCREMENT PRIMARY KEY,

    transaction_id         STRING,
    order_id               STRING,

    date_key               NUMBER,
    store_key              NUMBER,
    product_key            NUMBER,
    supplier_key           NUMBER,

    quantity_sold          NUMBER,
    quantity_received      NUMBER,

    sales_revenue          FLOAT,
    total_cost             FLOAT,
    gross_profit           FLOAT,
    gross_margin_percent   FLOAT,

    source_file            STRING,
    processing_time        TIMESTAMP

);

-- ============================================================
-- 3. IoT Sensor Fact Table
-- Source : stg_json_sensor
-- Grain  : One row per sensor reading event
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.fact_iot_sensor (

    sensor_fact_key    NUMBER AUTOINCREMENT PRIMARY KEY,

    event_id           STRING,
    date_key           NUMBER,
    store_key          NUMBER,

    sensor_name        STRING,
    sensor_value       FLOAT,
    sensor_unit        STRING,
    battery_pct        NUMBER,

    event_ts           TIMESTAMP,
    source_file        STRING,
    processing_time    TIMESTAMP

);
