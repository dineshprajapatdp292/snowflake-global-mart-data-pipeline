-- ============================================================
-- Project : Snowflake Global Mart Data Pipeline
-- File    : merge_transformations.sql
-- Author  : Dinesh Prajapat
-- Layer   : Silver
-- Purpose : Merge and transform raw data into Silver tables
-- ============================================================

USE DATABASE global_mart_db;
USE SCHEMA staging;

-- ============================================================
-- CSV -> Silver Transformation
-- ============================================================

MERGE INTO global_mart_db.staging.stg_csv_transaction AS s

USING (

SELECT

transaction_id,
store_id,
store_name,
store_city,
store_region,
cashier_id,
customer_id,
transaction_date,
transaction_time,

product_sku,
product_name,

UPPER(category) AS category,

subcategory,

CASE
WHEN quantity > 0 THEN quantity
ELSE 0
END AS quantity,

CASE
WHEN unit_price > 0 THEN unit_price
ELSE 0
END AS unit_price,

CASE
WHEN discount_pct >= 0 THEN discount_pct
ELSE 0
END AS discount_pct,

total_amount,

CASE
WHEN UPPER(payment_method)='CREDIT CARD'
THEN 'CC'

WHEN UPPER(payment_method)='DEBIT CARD'
THEN 'DC'

ELSE payment_method

END AS payment_method,

loyalty_points,

load_ts,

source_file,

TO_TIMESTAMP(
CONCAT(
transaction_date,
' ',
transaction_time
)
) AS transaction_ts,

quantity *
(
unit_price -
(unit_price * discount_pct /100)
) AS line_total,

CURRENT_TIMESTAMP() AS processing_time,

METADATA$ACTION,
METADATA$ISUPDATE

FROM global_mart_db.raw.stream_csv_pos_transactions_raw

) st

ON s.transaction_id=st.transaction_id

WHEN MATCHED
AND st.METADATA$ACTION='INSERT'
AND st.METADATA$ISUPDATE='TRUE'

THEN UPDATE SET

s.store_id=st.store_id,
s.store_name=st.store_name,
s.store_city=st.store_city,
s.store_region=st.store_region,
s.cashier_id=st.cashier_id,
s.customer_id=st.customer_id,
s.transaction_date=st.transaction_date,
s.transaction_time=st.transaction_time,
s.transaction_ts=st.transaction_ts,
s.product_sku=st.product_sku,
s.product_name=st.product_name,
s.category=st.category,
s.subcategory=st.subcategory,
s.quantity=st.quantity,
s.unit_price=st.unit_price,
s.discount_pct=st.discount_pct,
s.total_amount=st.total_amount,
s.line_total=st.line_total,
s.payment_method=st.payment_method,
s.loyalty_points=st.loyalty_points,
s.load_ts=st.load_ts,
s.source_file=st.source_file,
s.processing_time=st.processing_time

WHEN NOT MATCHED
AND st.METADATA$ACTION='INSERT'
AND st.METADATA$ISUPDATE='FALSE'

THEN INSERT(

transaction_id,
store_id,
store_name,
store_city,
store_region,
cashier_id,
customer_id,
transaction_date,
transaction_time,
transaction_ts,
product_sku,
product_name,
category,
subcategory,
quantity,
unit_price,
discount_pct,
total_amount,
payment_method,
loyalty_points,
load_ts,
source_file,
line_total,
processing_time

)

VALUES(

st.transaction_id,
st.store_id,
st.store_name,
st.store_city,
st.store_region,
st.cashier_id,
st.customer_id,
st.transaction_date,
st.transaction_time,
st.transaction_ts,
st.product_sku,
st.product_name,
st.category,
st.subcategory,
st.quantity,
st.unit_price,
st.discount_pct,
st.total_amount,
st.payment_method,
st.loyalty_points,
st.load_ts,
st.source_file,
st.line_total,
st.processing_time

)

WHEN MATCHED

AND st.METADATA$ACTION='DELETE'
AND st.METADATA$ISUPDATE='FALSE'

THEN DELETE;

-- ============================================================
-- JSON -> Silver Transformation
-- ============================================================

MERGE INTO global_mart_db.staging.stg_json_sensor AS stg

USING(

SELECT

event_id,
event_type,
store_id,
store_name,
event_ts,
device_id,

raw_payload:metadata.firmware::STRING AS firmware,

raw_payload:metadata.battery_pct::INT AS battery_pct,

raw_payload:metadata.store_floor::INT AS store_floor,

f.value:sensor::STRING AS sensor_name,

f.value:value::FLOAT AS sensor_value,

f.value:unit::STRING AS sensor_unit,

source_file,
loaded_at,

CURRENT_TIMESTAMP() AS processed_ts

FROM global_mart_db.raw.json_iot_events_raw,

LATERAL FLATTEN(input=>raw_payload:readings) f

) src

ON stg.event_id=src.event_id

AND stg.sensor_name=src.sensor_name

WHEN NOT MATCHED

THEN INSERT(

event_id,
event_type,
store_id,
store_name,
event_ts,
device_id,
firmware,
battery_pct,
store_floor,
sensor_name,
sensor_value,
sensor_unit,
source_file,
loaded_at,
processed_ts

)

VALUES(

src.event_id,
src.event_type,
src.store_id,
src.store_name,
src.event_ts,
src.device_id,
src.firmware,
src.battery_pct,
src.store_floor,
src.sensor_name,
src.sensor_value,
src.sensor_unit,
src.source_file,
src.loaded_at,
src.processed_ts

);

-- ============================================================
-- Parquet -> Silver Transformation
-- ============================================================

MERGE INTO global_mart_db.staging.stg_parquet_erp stg

USING(

SELECT

order_id,
order_date,
store_id,
supplier_id,
store_city,
supplier_name,
supplier_city,
product_sku,
category,
unit_cost,
total_cost,
quantity_ordered,
quantity_received,
order_status,
expected_delivery,
actual_delivery,
warehouse_id,
lead_time_days,
is_late,

CURRENT_TIMESTAMP() AS processing_time

FROM global_mart_db.raw.stream_parquet_erp_raw_table

) str

ON stg.order_id=str.order_id

WHEN NOT MATCHED

THEN INSERT(

order_id,
order_date,
store_id,
supplier_id,
store_city,
supplier_name,
supplier_city,
product_sku,
category,
unit_cost,
total_cost,
quantity_ordered,
quantity_received,
order_status,
expected_delivery,
actual_delivery,
warehouse_id,
lead_time_days,
is_late,
processing_time

)

VALUES(

str.order_id,
str.order_date,
str.store_id,
str.supplier_id,
str.store_city,
str.supplier_name,
str.supplier_city,
str.product_sku,
str.category,
str.unit_cost,
str.total_cost,
str.quantity_ordered,
str.quantity_received,
str.order_status,
str.expected_delivery,
str.actual_delivery,
str.warehouse_id,
str.lead_time_days,
str.is_late,
str.processing_time

);
