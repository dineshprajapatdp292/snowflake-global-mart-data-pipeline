# Architecture

This diagram illustrates the end-to-end data engineering pipeline built on Snowflake. It demonstrates how CSV, JSON, and Parquet data are ingested from Amazon S3 using Snowpipe, transformed through Bronze, Silver, and Gold layers, and finally consumed by Power BI for business reporting and analytics.

## System Architecture

![Global Mart Architecture](architecture.png)

## Pipeline Summary

CSV / JSON / Parquet → Amazon S3 → Storage Integration → Snowflake Stages → Snowpipe → RAW (Bronze) → Streams → Tasks → STAGING (Silver) → MARTS (Gold) → Power BI Dashboard

## Technologies Used

- Snowflake
- Amazon S3
- Snowpipe
- Streams
- Tasks
- SQL
- Medallion Architecture
- Power BI

## Key Features

- Automatic data ingestion using Snowpipe
- Multi-format file processing (CSV, JSON, and Parquet)
- Change Data Capture (CDC) using Streams
- Automated transformations using Tasks
- Bronze, Silver, and Gold architecture
- Analytics-ready Gold data marts

---

> **Portfolio Project:** This project demonstrates a production-inspired data engineering pipeline built using Snowflake best practices. It showcases enterprise concepts such as Snowpipe, Streams, Tasks, Medallion Architecture, and automated data ingestion for learning and portfolio purposes. 
