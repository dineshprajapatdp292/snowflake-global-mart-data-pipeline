# Architecture

This folder contains the high-level architecture of the Global Mart Data Platform.

## Pipeline Flow

CSV / JSON / Parquet
        ↓
AWS S3
        ↓
Storage Integration
        ↓
Snowflake Stages
        ↓
Snowpipe
        ↓
RAW (Bronze)
        ↓
Streams
        ↓
Tasks
        ↓
STAGING (Silver)
        ↓
MARTS (Gold)
        ↓
Power BI Dashboard
