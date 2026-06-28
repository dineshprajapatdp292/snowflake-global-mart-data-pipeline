# 🚀 Snowflake Global Mart Data Pipeline
![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?logo=snowflake&logoColor=white)

![AWS S3](https://img.shields.io/badge/AWS-S3-orange?logo=amazonaws)

![SQL](https://img.shields.io/badge/SQL-Database-blue)

![Power BI](https://img.shields.io/badge/PowerBI-F2C811?logo=powerbi)

This project builds a production-inspired retail data platform that ingests, transforms, and serves enterprise retail data using Snowflake's Medallion Architecture.
---

## 📖 Project Overview

This project simulates a production-style retail data platform where multiple data sources are ingested into Snowflake for analytics.

The pipeline processes structured and semi-structured data from CSV, JSON, and Parquet files stored in Amazon S3. Using Snowpipe, Streams, and Tasks, the data is automatically loaded, transformed through the Medallion Architecture (Bronze, Silver, and Gold layers), and prepared for business reporting in Power BI.

The objective of this project is to demonstrate modern Data Engineering concepts, including automated ingestion, Change Data Capture (CDC), scheduled transformations, and scalable cloud data warehousing.

---
# 🏗️ Architecture

The following architecture illustrates the complete end-to-end data flow from data ingestion to business reporting.

![Architecture](architecture/architecture.png)

---

# 🛠️ Technology Stack

| Category | Technologies |
|-----------|--------------|
| Cloud | AWS S3 |
| Data Warehouse | Snowflake |
| Language | SQL |
| Data Ingestion | Snowpipe |
| CDC | Streams |
| Automation | Tasks |
| Data Architecture | Medallion Architecture |
| Analytics | Power BI |

# 📊 Data Sources

This project ingests data from multiple enterprise systems to simulate a real-world retail environment.

| Data Source | File Format | Description |
|-------------|-------------|-------------|
| POS Transactions | CSV | Retail sales, customers, products, and payments |
| IoT Sensor Events | JSON | Store temperature, humidity, footfall, and sensor events |
| ERP / Supply Chain | Parquet | Orders, inventory, suppliers, warehouses, and returns |

---

# 📂 Project Structure

```
snowflake-global-mart-data-pipeline/
│
├── architecture/
│   ├── architecture.png
│   └── README.md
│
├── project_code/
│   ├── 01_storage_integration.sql
│   ├── 02_file_formats.sql
│   ├── 03_stages.sql
│   ├── 04_tables.sql
│   ├── 05_snowpipe.sql
│   ├── 06_streams.sql
│   ├── 07_tasks.sql
│   ├── 08_transformations.sql
│   └── 09_powerbi_views.sql
│
├── README.md
```
---

# ⚙️ Pipeline Workflow

The project follows a modern Medallion Architecture (Bronze → Silver → Gold) to ingest, transform, and serve data for analytics.

| Step | Description |
|------|-------------|
| 1 | CSV, JSON, and Parquet files are uploaded to Amazon S3. |
| 2 | Snowflake Storage Integration securely connects Snowflake to Amazon S3. |
| 3 | External Stages provide access to source files. |
| 4 | Snowpipe automatically ingests new files into the Bronze layer. |
| 5 | Bronze tables store raw data exactly as received. |
| 6 | Streams capture inserted and updated records (CDC). |
| 7 | Tasks execute SQL transformations automatically. |
| 8 | Silver layer cleans, validates, and standardizes the data. |
| 9 | Gold layer creates business-ready fact and dimension tables. |
| 10 | Power BI connects to Gold tables for dashboards and reporting. |

## Pipeline Flow

```text
CSV / JSON / Parquet
        │
        ▼
Amazon S3
        │
        ▼
Storage Integration
        │
        ▼
Snowflake External Stage
        │
        ▼
Snowpipe
        │
        ▼
Bronze Layer (RAW)
        │
        ▼
Streams (CDC)
        │
        ▼
Tasks (Automation)
        │
        ▼
Silver Layer
        │
        ▼
Gold Layer
        │
        ▼
Power BI Dashboard
```

---

# 🗄️ Database Objects

The project uses the following Snowflake objects to build a complete automated data pipeline.

| Object | Purpose |
|---------|---------|
| Database | Stores all project data and objects |
| Schema | Organizes project objects into logical groups |
| Storage Integration | Securely connects Snowflake to Amazon S3 |
| File Formats | Defines how CSV, JSON, and Parquet files are read |
| External Stages | References data stored in Amazon S3 |
| Snowpipe | Automatically loads newly arrived files |
| Bronze Tables | Stores raw source data |
| Streams | Captures Change Data Capture (CDC) events |
| Tasks | Automates SQL transformations |
| Silver Tables | Stores cleaned and validated data |
| Gold Tables | Stores business-ready analytical data |
| Views | Provides simplified access for reporting |

---

# ✨ Project Features

- End-to-End Data Engineering Pipeline
- Supports CSV, JSON, and Parquet file formats
- Automated file ingestion using Snowpipe
- Secure Amazon S3 integration
- Bronze, Silver, and Gold Medallion Architecture
- Change Data Capture (CDC) using Streams
- Automated SQL transformations using Tasks
- Scalable cloud-native architecture
- Business-ready analytical data marts
- Interactive Power BI dashboards

- ---

# 📈 Business Use Cases

This project demonstrates how a retail organization can build a scalable analytics platform.

Example business insights include:

- Daily Sales Analysis
- Product Performance
- Store Performance
- Customer Purchasing Trends
- Gross Margin Analysis
- Inventory Analytics
- IoT Sensor Monitoring
- Executive Dashboards

- ---

# 👨‍💻 Author

**Dinesh Prajapat**

Data Engineer | Snowflake | SQL | Python | Azure | AWS

GitHub:
https://github.com/dineshprajapatdp292

LinkedIn:
www.linkedin.com/in/dinesh-prajapat-704678331

---
⭐ If you found this project helpful, don't forget to star the repository.

- 
