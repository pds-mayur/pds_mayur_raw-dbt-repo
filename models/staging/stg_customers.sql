{{
  config(
    materialized='table'
  )
}}

{% do run_query("COPY INTO @ECOMMERCE_DB.RAW.MISSING_EXTERNAL_STAGE/customers_export.csv FROM (SELECT * FROM ECOMMERCE_DB.RAW.CUSTOMERS) FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '\"')") %}

select *
from ECOMMERCE_DB.RAW.CUSTOMERS
