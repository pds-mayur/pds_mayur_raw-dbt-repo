-- dbt / Snowflake invalid argument type

WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT
    SUM(product_name) AS total
FROM source_data


-- corrected code

/*WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT
    SUM(price) AS total_price
FROM source_data;*/

-- or

/*WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT
    COUNT(product_name) AS total_products
FROM source_data;*/
