-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : create_streams.sql
-- Author  : Dinesh Prajapat
-- Layer   : Bronze
-- Purpose : Create Streams for Change Data Capture (CDC)
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA raw;

-- ============================================================
-- Stream on CSV Raw Table
-- ============================================================

CREATE OR REPLACE STREAM global_mart_db.raw.stream_csv_pos_transactions_raw
ON TABLE global_mart_db.raw.csv_pos_transactions_raw
APPEND_ONLY = TRUE;


-- ============================================================
-- Stream on JSON Raw Table
-- ============================================================

CREATE OR REPLACE STREAM global_mart_db.raw.stream_json_iot_events_raw
ON TABLE global_mart_db.raw.json_iot_events_raw
APPEND_ONLY = TRUE;


-- ============================================================
-- Stream on Parquet Raw Table
-- ============================================================

CREATE OR REPLACE STREAM global_mart_db.raw.stream_parquet_erp_raw_table
ON TABLE global_mart_db.raw.parquet_erp_raw_table
APPEND_ONLY = TRUE;
