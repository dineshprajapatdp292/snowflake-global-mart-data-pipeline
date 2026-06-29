-- ===========================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : stages.sql
-- Author  : Dinesh Prajapat
-- Purpose : Create external stages for S3 data ingestion
-- Layer   : Storage
-- ===========================================================

USE DATABASE global_mart_db;
USE SCHEMA integrations;

---------------------------------------------------------
-- POS Transactions Stage (CSV)
---------------------------------------------------------
CREATE OR REPLACE STAGE stg_pos
URL='s3://global-mart-db/pos/'
STORAGE_INTEGRATION = s3_global_mart_int
FILE_FORMAT = ff_csv;

---------------------------------------------------------
-- IoT Events Stage (JSON)
---------------------------------------------------------
CREATE OR REPLACE STAGE stg_iot
URL='s3://global-mart-db/iot/'
STORAGE_INTEGRATION = s3_global_mart_int
FILE_FORMAT = ff_json;

---------------------------------------------------------
-- ERP Orders Stage (PARQUET)
---------------------------------------------------------
CREATE OR REPLACE STAGE stg_erp
URL='s3://global-mart-db/erp/'
STORAGE_INTEGRATION = s3_global_mart_int
FILE_FORMAT = ff_parquet;
