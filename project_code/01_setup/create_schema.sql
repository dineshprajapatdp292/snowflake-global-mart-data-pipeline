
-- ============================================================
-- Project  : Snowflake Global Mart Data Pipeline
-- Author   : Dinesh Prajapat
-- Purpose  : Create project schemas
-- Layer    : Setup
-- ============================================================

USE DATABASE global_mart_db;

CREATE OR REPLACE SCHEMA integrations;

CREATE OR REPLACE SCHEMA raw;

CREATE OR REPLACE SCHEMA staging;

CREATE OR REPLACE SCHEMA marts;

CREATE OR REPLACE SCHEMA utilities;
