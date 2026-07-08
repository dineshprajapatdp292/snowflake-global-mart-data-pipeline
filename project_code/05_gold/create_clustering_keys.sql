-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : create_clustering_keys.sql
-- Author  : Dinesh Prajapat
-- Layer   : Gold
-- Purpose : Add clustering keys to Gold fact tables
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA marts;

-- ============================================================
-- 1) Clustering for fact_daily_sales
-- Optimized for store/product/date-based analytics
-- ============================================================

ALTER TABLE global_mart_db.marts.fact_daily_sales
CLUSTER BY (date_key, store_key, product_key);

-- ============================================================
-- 2) Clustering for fact_gross_margin
-- Optimized for product/supplier/date-based profitability analysis
-- ============================================================

ALTER TABLE global_mart_db.marts.fact_gross_margin
CLUSTER BY (date_key, supplier_key, product_key);

-- ============================================================
-- 3) Clustering for fact_iot_sensor
-- Optimized for date/store/sensor analytics
-- ============================================================

ALTER TABLE global_mart_db.marts.fact_iot_sensor
CLUSTER BY (date_key, store_key, sensor_name);
