-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : create_raw_tables.sql
-- Author  : Dinesh Prajapat
-- Layer   : Bronze
-- Purpose : Create all Bronze layer raw tables
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA raw;

--------------------------------------------------------
-- CSV Raw Table
--------------------------------------------------------

CREATE OR REPLACE TABLE global_mart_db.raw.csv_pos_transactions_raw (
    transaction_id STRING,
    store_id STRING,
    store_name STRING,
    store_city STRING,
    store_region STRING,
    cashier_id STRING,
    customer_id STRING,
    transaction_date DATE,
    transaction_time TIME,
    product_sku STRING,
    product_name STRING,
    category STRING,
    subcategory STRING,
    quantity INT,
    unit_price INT,
    discount_pct INT,
    total_amount INT,
    payment_method STRING,
    loyalty_points INT,
    load_ts TIMESTAMP,
    source_file STRING
);

--------------------------------------------------------
-- JSON Raw Table
--------------------------------------------------------

CREATE OR REPLACE TABLE global_mart_db.raw.json_iot_events_raw (
    event_id VARCHAR(50),
    event_type VARCHAR(50),
    store_id VARCHAR(50),
    store_name VARCHAR(50),
    event_ts TIMESTAMP_NTZ,
    device_id VARCHAR(50),
    metadata VARIANT,
    readings VARIANT,
    raw_payload VARIANT,
    source_file STRING,
    loaded_at TIMESTAMP
);

--------------------------------------------------------
-- Parquet Raw Table
--------------------------------------------------------

CREATE OR REPLACE TABLE global_mart_db.raw.parquet_erp_raw_table (
    order_id VARCHAR,
    order_date TIMESTAMP,
    store_id VARCHAR,
    supplier_id VARCHAR,
    store_city STRING,
    supplier_name STRING,
    supplier_city STRING,
    product_sku STRING,
    category STRING,
    unit_cost INT,
    total_cost INT,
    quantity_ordered INT,
    quantity_received INT,
    order_status STRING,
    expected_delivery DATE,
    actual_delivery DATE,
    warehouse_id STRING,
    lead_time_days INT,
    is_late STRING,
    file_load_time TIMESTAMP,
    sourcefile_name STRING
);
