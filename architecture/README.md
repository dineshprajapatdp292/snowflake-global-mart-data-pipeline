# Architecture

This folder contains the high-level architecture of the Global Mart Data Platform.

## System Architecture

![Global Mart Architecture](architecture.png)

## Pipeline Summary

CSV / JSON / Parquet → Amazon S3 → Storage Integration → Snowflake Stages → Snowpipe → RAW (Bronze) → Streams → Tasks → STAGING (Silver) → MARTS (Gold) → Power BI Dashboard
