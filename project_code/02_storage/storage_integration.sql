-- ===========================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : storage_integration.sql
-- Purpose : Create Snowflake Storage Integration with AWS S3
-- ===========================================================

USE DATABASE global_mart_db;
USE SCHEMA integrations;

CREATE OR REPLACE STORAGE INTEGRATION s3_global_mart_int
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::<ACCOUNT-ID>:role/snowflake-s3-role'
STORAGE_ALLOWED_LOCATIONS = (
's3://global-mart-db/'
);
