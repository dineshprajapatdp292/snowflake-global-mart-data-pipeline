-- ============================================================
-- Project  : Snowflake Global Mart Data Pipeline
-- Author   : Dinesh Prajapat
-- Purpose  : Create virtual warehouses
-- Layer    : Setup
-- ============================================================

CREATE OR REPLACE WAREHOUSE GM_INGEST_WH
WITH
WAREHOUSE_SIZE='XSMALL'
AUTO_SUSPEND=60
AUTO_RESUME=TRUE
INITIALLY_SUSPENDED=TRUE;

CREATE OR REPLACE WAREHOUSE GM_TRANSFORM_WH
WITH
WAREHOUSE_SIZE='SMALL'
AUTO_SUSPEND=60
AUTO_RESUME=TRUE
INITIALLY_SUSPENDED=TRUE;
