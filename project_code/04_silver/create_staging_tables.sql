-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : create_staging_tables.sql
-- Author  : Dinesh Prajapat
-- Layer   : Silver
-- Purpose : Create staging tables for cleaned and transformed data
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA staging;

-- ============================================================
-- CSV Staging Table
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.staging.stg_csv_transaction (
    transaction_id STRING,
    store_id STRING,
    store_name STRING,
    store_city STRING,
    store_region STRING,
    cashier_id STRING,
    customer_id STRING,
    transaction_date DATE,
    transaction_time TIME,
    product_name STRING,
    category STRING,
    subcategory STRING,
    quantity INT,
    unit_price FLOAT,
    discount_pct INT,
    total_amount FLOAT,
    payment_method STRING,
    loyalty_points INT,
    load_ts TIMESTAMP,
    source_file STRING,
    product_sku STRING,

    transaction_ts TIMESTAMP,
    line_total FLOAT,
    processing_time TIMESTAMP
);



-- ============================================================
-- JSON Staging Table
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.staging.stg_json_sensor (
    event_id STRING,
    event_type STRING,
    store_id STRING,
    store_name STRING,
    event_ts TIMESTAMP,
    device_id STRING,
    firmware STRING,
    battery_pct INT,
    store_floor INT,
    sensor_name STRING,
    sensor_value FLOAT,
    sensor_unit STRING,
    source_file STRING,
    loaded_at TIMESTAMP,
    processed_ts TIMESTAMP
);



-- ============================================================
-- PARQUET Staging Table
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.staging.stg_parquet_erp (
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
    sourcefile_name STRING,
    processing_time TIMESTAMP
);
