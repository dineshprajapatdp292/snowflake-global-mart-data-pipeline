-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : create_pipes.sql
-- Author  : Dinesh Prajapat
-- Layer   : Bronze
-- Purpose : Create Snowpipes for automatic data ingestion
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA integrations;

-- ============================================================
-- CSV Snowpipe
-- ============================================================

CREATE OR REPLACE PIPE global_mart_db.integrations.csv_pipe
AUTO_INGEST = TRUE
AS
COPY INTO global_mart_db.raw.csv_pos_transactions_raw
FROM (
    SELECT
        $1,
        $2,
        $3,
        $4,
        $5,
        $6,
        $7,
        $8,
        $9,
        $10,
        $11,
        $12,
        $13,
        $14,
        $15,
        $16,
        $17,
        $18,
        $19,
        CURRENT_TIMESTAMP(),
        METADATA$FILENAME
    FROM @global_mart_db.integrations.stg_pos
)
FILE_FORMAT = (
    FORMAT_NAME = 'global_mart_db.integrations.csv_format'
)
ON_ERROR = 'CONTINUE';



-- ============================================================
-- JSON Snowpipe
-- ============================================================

CREATE OR REPLACE PIPE global_mart_db.integrations.json_pipe
AUTO_INGEST = TRUE
AS
COPY INTO global_mart_db.raw.json_iot_events_raw
FROM (
    SELECT
        $1:event_id::STRING,
        $1:event_type::STRING,
        $1:store_id::STRING,
        $1:store_name::STRING,
        $1:timestamp::TIMESTAMP,
        $1:device_id::STRING,
        $1:metadata,
        $1:readings,
        $1,
        METADATA$FILENAME,
        CURRENT_TIMESTAMP()
    FROM @global_mart_db.integrations.stg_iot/iot
)
FILE_FORMAT = (
    FORMAT_NAME = 'global_mart_db.integrations.json_format'
);



-- ============================================================
-- PARQUET Snowpipe
-- ============================================================

CREATE OR REPLACE PIPE global_mart_db.integrations.parauqet_pipe
AUTO_INGEST = TRUE
AS
COPY INTO global_mart_db.raw.parquet_erp_raw_table
FROM (
    SELECT
        $1:order_id::VARCHAR,
        $1:order_date::TIMESTAMP,
        $1:store_id::VARCHAR,
        $1:supplier_id::VARCHAR,
        $1:store_city::VARCHAR,
        $1:supplier_name::VARCHAR,
        $1:supplier_city::VARCHAR,
        $1:product_sku::VARCHAR,
        $1:category::VARCHAR,
        $1:unit_cost::INT,
        $1:total_cost::INT,
        $1:quantity_ordered::INT,
        $1:quantity_received::INT,
        $1:order_status::VARCHAR,
        $1:expected_delivery::DATE,
        $1:actual_delivery::DATE,
        $1:warehouse_id::VARCHAR,
        $1:lead_time_days::INT,
        $1:is_late::VARCHAR,
        CURRENT_TIMESTAMP(),
        METADATA$FILENAME
    FROM @global_mart_db.integrations.stg_erp
)
FILE_FORMAT = (
    FORMAT_NAME = 'global_mart_db.integrations.paraquet_file_format'
);
