# Architecture

This diagram illustrates the end-to-end data engineering pipeline built on Snowflake. It demonstrates how CSV, JSON, and Parquet data are ingested from Amazon S3 using Snowpipe, transformed through Bronze, Silver, and Gold layers, and finally consumed by Power BI for business reporting and analytics.

## System Architecture

![Global Mart Architecture](architecture.png)

## Pipeline Summary

CSV / JSON / Parquet → Amazon S3 → Storage Integration → Snowflake Stages → Snowpipe → RAW (Bronze) → Streams → Tasks → STAGING (Silver) → MARTS (Gold) → Power BI Dashboard
