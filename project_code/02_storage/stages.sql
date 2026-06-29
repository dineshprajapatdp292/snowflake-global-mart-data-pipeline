-- ===========================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : file_formats.sql
-- Author  : Dinesh Prajapat
-- Purpose : Create reusable file formats for data ingestion
-- Layer   : Storage
-- ===========================================================

USE DATABASE global_mart_db;
USE SCHEMA integrations;

-- CSV File Format
CREATE OR REPLACE FILE FORMAT ff_csv
TYPE = 'CSV'
FIELD_DELIMITER = ','
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
NULL_IF = ('NULL','null','');

-- JSON File Format
CREATE OR REPLACE FILE FORMAT ff_json
TYPE = 'JSON';

-- Parquet File Format
CREATE OR REPLACE FILE FORMAT ff_parquet
TYPE = 'PARQUET';
