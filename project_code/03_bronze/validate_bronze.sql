SELECT * FROM global_mart_db.raw.csv_pos_transactions_raw;

SELECT * FROM global_mart_db.raw.json_iot_events_raw;

SELECT * FROM global_mart_db.raw.parquet_erp_raw_table;

DESC PIPE global_mart_db.integrations.csv_pipe;

DESC PIPE global_mart_db.integrations.json_pipe;

DESC PIPE global_mart_db.integrations.parauqet_pipe;

SELECT SYSTEM$PIPE_STATUS('global_mart_db.integrations.csv_pipe');

SELECT SYSTEM$PIPE_STATUS('global_mart_db.integrations.json_pipe');

SELECT SYSTEM$PIPE_STATUS('global_mart_db.integrations.parauqet_pipe');

SHOW STREAMS;
