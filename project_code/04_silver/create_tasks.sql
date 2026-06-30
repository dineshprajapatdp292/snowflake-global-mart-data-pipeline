-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : create_tasks.sql
-- Author  : Dinesh Prajapat
-- Layer   : Silver
-- Purpose : Create scheduled tasks for Silver layer processing
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA utilities;

-- ============================================================
-- CSV Task
-- ============================================================

CREATE OR REPLACE TASK global_mart_db.utilities.csv_task_silver
WAREHOUSE = GM_TRANSFORM_WH
SCHEDULE = '1 minute'
AS

-- Execute merge_transformations.sql
-- (CSV MERGE statement)


-- ============================================================
-- JSON Task
-- ============================================================

CREATE OR REPLACE TASK global_mart_db.utilities.json_task_silver
WAREHOUSE = GM_TRANSFORM_WH
SCHEDULE = '1 minute'
AS

-- Execute merge_transformations.sql
-- (JSON MERGE statement)


-- ============================================================
-- PARQUET Task
-- ============================================================

CREATE OR REPLACE TASK global_mart_db.utilities.task_parquet_silver
WAREHOUSE = GM_TRANSFORM_WH
SCHEDULE = '1 minute'
AS

-- Execute merge_transformations.sql
-- (PARQUET MERGE statement)
