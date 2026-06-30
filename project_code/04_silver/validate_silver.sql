-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : validate_silver.sql
-- Author  : Dinesh Prajapat
-- Layer   : Silver
-- Purpose : Validate Silver layer transformations
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA staging;

----------------------------------------------------------
-- CSV
----------------------------------------------------------

SELECT *
FROM global_mart_db.staging.stg_csv_transaction;

----------------------------------------------------------
-- JSON
----------------------------------------------------------

SELECT *
FROM global_mart_db.staging.stg_json_sensor;

----------------------------------------------------------
-- PARQUET
----------------------------------------------------------

SELECT *
FROM global_mart_db.staging.stg_parquet_erp;

----------------------------------------------------------
-- Task Status
----------------------------------------------------------

SHOW TASKS;

ALTER TASK global_mart_db.utilities.csv_task_silver SUSPEND;
ALTER TASK global_mart_db.utilities.csv_task_silver RESUME;

ALTER TASK global_mart_db.utilities.json_task_silver SUSPEND;
ALTER TASK global_mart_db.utilities.json_task_silver RESUME;

ALTER TASK global_mart_db.utilities.task_parquet_silver SUSPEND;
ALTER TASK global_mart_db.utilities.task_parquet_silver RESUME;
