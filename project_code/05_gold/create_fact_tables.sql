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
-- Daily Sales Fact Table
-- ============================================================

CREATE OR REPLACE TABLE global_mart_db.marts.fact_daily_sales (

    sales_key          NUMBER AUTOINCREMENT PRIMARY KEY,

    date_key           NUMBER,

    store_key          NUMBER,

    product_key        NUMBER,

    quantity           NUMBER,

    unit_price         FLOAT,

    discount_pct       FLOAT,

    revenue            FLOAT,

    loyalty_points     NUMBER,

    processing_time    TIMESTAMP

);

--------------------------------------------------------------
-- Gross Margin Fact Table
--------------------------------------------------------------

CREATE OR REPLACE TABLE global_mart_db.marts.fact_gross_margin (

    margin_key             NUMBER AUTOINCREMENT PRIMARY KEY,

    date_key               NUMBER,

    store_key              NUMBER,

    supplier_key           NUMBER,

    product_key            NUMBER,

    quantity_received      NUMBER,

    total_cost             FLOAT,

    gross_revenue          FLOAT,

    gross_profit           FLOAT,

    gross_margin_percent   FLOAT,

    processing_time        TIMESTAMP

);

--------------------------------------------------------------
-- IoT Analytics Fact Table
--------------------------------------------------------------

CREATE OR REPLACE TABLE global_mart_db.marts.fact_iot_sensor (

    sensor_key         NUMBER AUTOINCREMENT PRIMARY KEY,

    date_key           NUMBER,

    store_key          NUMBER,

    sensor_name        STRING,

    sensor_value       FLOAT,

    sensor_unit        STRING,

    battery_pct        NUMBER,

    processing_time    TIMESTAMP

);
